import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/mapbox_handler.dart';
import 'package:mapbox_navigation/views/navigation/routing.dart';
import 'package:mapbox_navigation/views/widgets/panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
   var widget;
  var height;
  MapScreen({Key? key, required this.widget, required this.height}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PanelController panelController = PanelController();
  late CameraPosition initialCameraPosition;
  late MapboxMapController mapboxMapController;

  @override
  void initState() {
    initialCameraPosition =
        CameraPosition(target: getCenterCoordinatesForPolyline(getController.geometry!), zoom: 15);
    for (String type in ['source', 'destination']) {
      getController.locations.add(CameraPosition(target: getTripLatlng(type)));
    }
    getController.initailizeDirectionResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());
    return SafeArea(
      child: Scaffold(

        extendBody: true,
        body: GetBuilder<NavigationController>(builder: (controller) {
          return SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * widget.height,
                controller: panelController,
                parallaxEnabled: false,
                parallaxOffset: .5,
            body: Stack(
              children: 
                [SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: MapboxMap(
                    initialCameraPosition: initialCameraPosition,
                    accessToken:
                        "pk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDFuMHBoMzUwNWliM2RxdWdwZGNlcHIxIn0.MUOfQz_xGPAAAzwLAXoJXA",
                    onMapCreated: controller.onMapCreated,
                    onStyleLoadedCallback: controller.onStyleLoadedCallback,
                    myLocationEnabled: true,
                    myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                    // minMaxZoomPreference: const MinMaxZoomPreference(14, 19),
                  ),
                ),
                Positioned(
            right: 0,
            child: IconButton(onPressed: (){ mapboxMapController.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));}, icon: Icon(Icons.my_location),color: Colors.blue.shade400,))
              ],
            ),
             panelBuilder: (controller) => Visibility(
                  child: PanelWidget(
                      controller: controller,
                      panelController: panelController,
                      widget: widget.widget),
                ),
          );
        }),
        floatingActionButton: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RoutingScreen()));
        }, icon: Icon(Icons.route)),
      ),
    );
  }
}
