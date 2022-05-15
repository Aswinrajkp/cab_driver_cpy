import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mapbox_navigation/helpers/dio_config.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';

Future<int?> detailsAddingPost({required vehicleType, required vehicleImage, required vehicleNumber, required rcBookImage, required rcbookNumber, required drivingLicenceImage, required drivingLicenceNumber }) async {
 var driverId = await IdStoring.getId();
  final data = {
    "vehicleType":vehicleType,
    "vehicleImage":vehicleImage,
    "vehicleNumber":vehicleNumber,
    "rcBookImage":rcBookImage,
    "rcbookNumber":rcbookNumber,
    "drivingLicenceImage":drivingLicenceImage,
    "drivingLicenceNumber":drivingLicenceNumber,
    "driverId": driverId,
  };

  try {
    print(driverId);
    Response response = await mainDio.post("/add_details", data: data);
    var jsonData = json.decode(response.data);
    return response.statusCode;
  } on Exception catch (e) {
    print(e.toString());
    return 400;
  }
}

