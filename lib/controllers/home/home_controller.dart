import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';


class HomeController extends GetxController{
   var position;
 var lastPosition;
 var lat ;
 var long ;



getCurrentLocation() async {
   position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   lastPosition = await Geolocator.getLastKnownPosition();
  lat = position.latitude;
  long = position.longitude;
  print("$lat");
  print("$long");
   update();
}
@override
  void onInit() {
  getCurrentLocation();
    super.onInit();
  }
}