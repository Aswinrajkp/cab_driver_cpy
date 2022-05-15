import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_navigation/helpers/dio_config.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';

Future loginPost({required email, required password}) async {
  String? driverId;

  final data = {
    "email": email,
    "password": password,
  };

  try {
    Response response = await mainDio.post("/login", data: data);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.data);
      driverId = jsonData["_id"];
      print(driverId);
      IdStoring.setId(driverId);

      return response.statusCode;
    } else {
      print("It's an error case");
    }
  } on Exception catch (e) {
    print(e.toString());

    return 400;
  }
}
