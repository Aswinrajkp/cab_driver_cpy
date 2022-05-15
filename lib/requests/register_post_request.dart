import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mapbox_navigation/helpers/dio_config.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';

Future<int?> registerPost(
    {required name, required password, required email, required phone}) async {
  String? driverId;

  final data = {
    "name": name,
    "password": password,
    "email": email,
    "phone": phone
  };
  Response response;
  try {
    response = await mainDio.post("/", data: data);

    var jsonData = json.decode(response.data);
    driverId = jsonData["_id"];
    print(driverId);

    IdStoring.setId(driverId);
    return 200;
  } on Exception catch (e) {
    print(e.toString());
    return 400;
  }
}
