import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/directions_handler.dart';
import 'package:mapbox_navigation/requests/profile_get_request.dart';

import 'package:mapbox_navigation/views/widgets/panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:toggle_switch/toggle_switch.dart';


class MainScreen extends StatefulWidget {
  var widget;
  var height;
  MainScreen({Key? key, required this.widget, required this.height})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();


}

class _MainScreenState extends State<MainScreen> {
  PanelController panelController = PanelController();
 late CameraPosition initialCameraPosition;
 late MapboxMapController mapboxMapController;
 late Future<Map> modified;
 late String distance;
  late String dropOffTime;
  late Map geometry;
  final List<CameraPosition> _kTripEndPoints = [];
 LatLng point = LatLng(11.8745, 75.3704);

 @override
  void initState(){
    //  modified= getDirectionsAPIResponse(getController.currentLocation,point);
    initialCameraPosition = CameraPosition(target:getController.currentLocation,zoom: 15);
    _kTripEndPoints
          .add(CameraPosition(target:getController.currentLocation));
          _kTripEndPoints.add(CameraPosition(target: point));
    // TODO: implement initState
    super.initState();
  }
  

  // initialiseDirectionsResponse()async {
  //   Map modifiedResponse = await modified;

  //   distance = (modifiedResponse['distance'] / 1000).toStringAsFixed(1);
  //   geometry = modifiedResponse['geometry'];
  // }

  onMapCreated(MapboxMapController controller) async {

    this.mapboxMapController = controller;
  }
  onStyleLoadedCallback() async {
    //for (int i = 0; i < _kTripEndPoints.length; i++) {
     // String iconImage = i == 0 ? 'circle' : 'square';
   //   await mapboxMapController.addSymbol(
       // SymbolOptions(
          // geometry: _kTripEndPoints[i].target,
         // iconSize: 0.1,
        //  iconImage: "assets/icon/$iconImage.png",
       // ),
      //);
  //  }
   // _addSourceAndLineLayer();
  }
  // _addSourceAndLineLayer() async {
  //   // Create a polyLine between source and destination
  //   final _fills = {
  //     "type": "FeatureCollection",
  //     "features": [
  //       {
  //         "type": "Feature",
  //         "id": 0,
  //         "properties": <String, dynamic>{},
  //         // "geometry": geometry,
  //       },
  //     ],
  //   };
  //    // Add new source and lineLayer
  //   await mapboxMapController.addSource("fills", GeojsonSourceProperties(data: _fills));
  //   await mapboxMapController.addLineLayer(
  //     "fills",
  //     "lines",
  //     LineLayerProperties(
  //       lineColor: Colors.indigo.toHexStringRGB(),
  //       lineCap: "round",
  //       lineJoin: "round",
  //       lineWidth: 3,
  //     ),
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    ProfileGettingController profile = Get.put(ProfileGettingController());
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SlidingUpPanel(
                minHeight: MediaQuery.of(context).size.height * widget.height,
                controller: panelController,
                parallaxEnabled: false,
                parallaxOffset: .5,
                body: Container(
                  child: Stack(
                    children: [
                    SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            child: MapboxMap(
              
              initialCameraPosition:initialCameraPosition,
            accessToken: "pk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDFuMHBoMzUwNWliM2RxdWdwZGNlcHIxIn0.MUOfQz_xGPAAAzwLAXoJXA",
            onMapCreated: onMapCreated,
            onStyleLoadedCallback: onStyleLoadedCallback,
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
            minMaxZoomPreference: const MinMaxZoomPreference(14, 17),
            ),
          ),Positioned(
            right: 0,
            child: IconButton(onPressed: (){ mapboxMapController.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));}, icon: Icon(Icons.my_location),color: Colors.blue.shade400,))
                    ],
                  ),
                ),
                panelBuilder: (controller) => Visibility(
                  child: PanelWidget(
                      controller: controller,
                      panelController: panelController,
                      widget: widget.widget),
                ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}
