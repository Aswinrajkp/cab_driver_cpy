import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../helpers/dio_exceptions.dart';

String baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
String accessToken =
    "sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ";

Dio _dio = Dio();

Future getReverseGeocodingGivenLatLngUsingMapbox(LatLng latLng) async {
  String query = '${latLng.longitude},${latLng.latitude}';
  String url = '$baseUrl/$query.json?access_token=$accessToken';
  url = Uri.parse(url).toString();
  print(url);
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
    debugPrint(errorMessage);
  }
}
