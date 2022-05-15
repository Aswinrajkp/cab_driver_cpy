
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/helpers/mapbox_handler.dart';
import 'package:mapbox_navigation/views/navigation/map.dart';

NavigationController getController = Get.put(NavigationController());

class NavigationController extends GetxController{
  late LatLng currentLocation;
  List? response = [];
   String? currentAddress;
   LocationData? locationData;
   LatLng? destinationLatlng;
   LatLng? pickupLatlng;
  late LatLng? pickupLocation = currentLocation;
   LatLng? destinationLocation = const LatLng(11.8745, 75.3704);
   Map? lastResponse;
  bool? isDestination = false;
   String? pickupjson; // for sharing
   String? destination; // for sharing
   MapboxMapController? mapboxMapController;
   String? distance;
   String? dropoffTime;
   Map? geometry;
  final List<CameraPosition> locations = [];

   String? pickUpLocationForDriver;

  // for map routinglate

late LatLng starting = pickupLatlng!;
late LatLng ending = destinationLatlng!;
late WayPoint startingWayPoint, endingWayPoint;
var wayPoints =<WayPoint>[];

late MapBoxNavigation directions;
late MapBoxOptions options;
late double distanceRemaining;
late double durationRemaining;
late MapBoxNavigationViewController controller;


final bool isMultipleStop = false;
String instruction = "";
bool arrived = false;
bool routeBuilt = false;
bool isNavigating = false;



  ///*********************8 For map showing with polylinses****************************///

  String apiKey =
      "sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ";

  isDestinationTrueChanging() {
    isDestination = true;
    update();
  }

  isDestinationFalseChanging() {
    isDestination = false;
    update();
  }

  sourceGetting(LatLng source) {
    pickupLocation = source;
    update();
  }

  destiGetting(LatLng destination) {
    destinationLocation = destination;
    update();
  }

  onChangedHandling(value) async {
    response = await getParsedResponseForQuery(value);
    update();
  }

  //***********search */

  userCurrentLocationButtonHandler() async {
    if (!isDestination!) {
      var response = await getParsedReverseGeocoding(currentLocation);
      var pickup = response["place"];
      pickupLatlng = response['location'];
      pickupjson = json.encode(response);
      pickUpLocationForDriver = response["place"];
      update();
      return pickup;
    }
  }
  changeSearchFalse(){
    isDestination = false;
    update();
    print('false');
  }
  changeSearchTrue(){
    isDestination = true;
    update();
    print('true');
  }

  destinationSetting(index) {
    destination = json.encode(response![index]);
    update();
  }

  pickupSetting(index) {
    pickupjson = json.encode(response![index]);
    pickUpLocationForDriver = response![index]["place"];
    update();
  }

  lastResponseGetting(context) async {
    // pickupLocation = await getTripLatlng("source");
    // destinationLocation = await getTripLatlng("destination");
    lastResponse = await getDirectionsAPIResponse();
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => MapScreen()));

    print(lastResponse);
    update();
  }

  destinationGetting(index) {
    destinationLatlng = response![index]['location'];
    update();
  }

  pickupGetting(index) {
    if (response![index]['location'] == null) {
      pickupLatlng = currentLocation;
      update();
    } else {
      pickupLatlng = response![index]['location'];
      update();
    }
  }


  onMapCreated(MapboxMapController controller) async {
    mapboxMapController = controller;
  }

  onStyleLoadedCallback() async {
    for (int i = 0; i < locations.length; i++) {
      String iconImage = i == 0 ? 'circle' : 'square';
      await mapboxMapController!.addSymbol(SymbolOptions(
        geometry: locations[i].target,
        iconSize: 0.1,
        iconImage: "assets/icon/$iconImage.png",
      ));
    }
    addSourceAndLineLayer();
  }

  addSourceAndLineLayer() async {
    final fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        }
      ]
    };
    await mapboxMapController!.addSource(
        "fills", GeojsonSourceProperties(data: fills));
    await mapboxMapController!.addLineLayer(
        "fills",
        "lines",
        LineLayerProperties(
          lineColor: Colors.indigo.toHexStringRGB(),
          lineCap: "round",
          lineJoin: "round",
          lineWidth: 5,
        ));
  }

  initailizeDirectionResponse() {
    distance = (lastResponse!['distance'] / 1000).toStringAsFixed(1);
    geometry = lastResponse!['geometry'];
    
  }


  //*******************For showing the route******************************//


//   initialize() async {
//   if(!mounted)return;

//   directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
//   options= MapBoxOptions(
//     zoom: 18.0,
//     voiceInstructionsEnabled: true,
//     bannerInstructionsEnabled: true,
//     mode: MapBoxNavigationMode.drivingWithTraffic,
//     isOptimized: true,
//     units: VoiceUnits.metric,
//     simulateRoute: true,
//     language: "en",
//   );

//   startingWayPoint = WayPoint(name: "starting", latitude: starting.latitude, longitude: starting.longitude);
//   endingWayPoint = WayPoint(name: "ending", latitude: ending.latitude, longitude: ending.longitude);
//   wayPoints.add(startingWayPoint);
//   wayPoints.add(endingWayPoint);
//   await directions.startNavigation(wayPoints: wayPoints, options: options);
// }

 Future<void> onRouteEvent(e) async {

        distanceRemaining = await directions.distanceRemaining;
        durationRemaining = await directions.durationRemaining;
    
        switch (e.eventType) {
          case MapBoxEvent.progress_change:
            var progressEvent = e.data as RouteProgressEvent;
            arrived = progressEvent.arrived!;
            if (progressEvent.currentStepInstruction != null)
              instruction = progressEvent.currentStepInstruction!;
            break;
          case MapBoxEvent.route_building:
          case MapBoxEvent.route_built:
            routeBuilt = true;
            break;
          case MapBoxEvent.route_build_failed:
            routeBuilt = false;
            break;
          case MapBoxEvent.navigation_running:
            isNavigating = true;
            break;
          case MapBoxEvent.on_arrival:
            arrived = true;
            if (!isMultipleStop) {
              await Future.delayed(Duration(seconds: 3));
              await controller.finishNavigation();
            } else {}
            break;
          case MapBoxEvent.navigation_finished:
          case MapBoxEvent.navigation_cancelled:
            routeBuilt = false;
            isNavigating = false;
            break;
          default:
            break;
        }
        update();
      }

      @override
  void onInit() {
  
    super.onInit();
  }
  
}