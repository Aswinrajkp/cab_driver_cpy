// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:mapbox_navigation/main.dart';
// import '../requests/mapbox_requests.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/requests/map_requests/mapbox_directions.dart';

Future<Map> getDirectionsAPIResponse(
    LatLng sourceLatLng, LatLng destinationLatLng) async {
  final response =
      await getCyclingRouteUsingMapbox(sourceLatLng, destinationLatLng);
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;
}
