import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';

class RoutingScreen extends StatefulWidget {
  RoutingScreen({Key? key}) : super(key: key);

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {

LatLng starting = getController.pickupLatlng!;
LatLng ending = getController.destinationLatlng!;
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

@override
  void initState() {
    initialize();
    super.initState();
  }

initialize() async {
  if(!mounted)return;

  directions = MapBoxNavigation(onRouteEvent: getController.onRouteEvent);
  options= MapBoxOptions(
    zoom: 18.0,
    voiceInstructionsEnabled: true,
    bannerInstructionsEnabled: true,
    mode: MapBoxNavigationMode.drivingWithTraffic,
    isOptimized: true,
    units: VoiceUnits.metric,
    simulateRoute: true,
    language: "en",
  );

  startingWayPoint = WayPoint(name: "starting", latitude: starting.latitude, longitude: starting.longitude);
  endingWayPoint = WayPoint(name: "ending", latitude: ending.latitude, longitude: ending.longitude);
  wayPoints.add(startingWayPoint);
  wayPoints.add(endingWayPoint);
  await directions.startNavigation(wayPoints: wayPoints, options: options);
}

  @override
  Widget build(BuildContext context) {
    return MainScreen(widget: BottomShowngScreen(), height:.31);
  }

 
}