import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/login/login.dart';
import 'package:mapbox_navigation/views/tab_navigation/tabbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationController getController = Get.put(NavigationController());



  @override
  void initState() {
    // TODO: implement initState
    initializeLocationAndSave();
     
    super.initState();
  }

late CameraPosition initialCameraPosition;
 late MapboxMapController mapboxMapController;

  void initializeLocationAndSave() async {
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }
    LocationData _locationData = await _location.getLocation();
   getController.currentLocation =
        LatLng(_locationData.latitude!, _locationData.longitude!);

  
// 625b97828ef99bcd4551171f


  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Tabbar()));


  }

 

  @override
  Widget build(BuildContext context) {
NavigationController getController = Get.put(NavigationController());


    return GetBuilder<NavigationController>(
      initState: (state){

      },
      builder: (controller) {
        return EasySplashScreen(
         durationInSeconds: 2,
          loaderColor: Colors.blue.shade400,
          gradientBackground: LinearGradient(colors: [
            Colors.blue.shade400,
            Colors.white,
          ],begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
            logo: const Image(image: AssetImage('assets/images/cab booking splash.png')),
            logoSize: 150.0,
            title: Text("Cab Hub",style: GoogleFonts.lobster(fontSize:40),),
            );
      }
    );
  }
}
