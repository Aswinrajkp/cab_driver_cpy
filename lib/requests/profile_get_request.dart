import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_navigation/helpers/dio_config.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';

class ProfileGettingController extends GetxController{
 late Response response;
var profile;
//  var user = FirebaseAuth.instance.currentUser!;
 

 profileGetting() async {
   String id =await IdStoring.getId();
   print(id);
    try {
      response = await mainDio.get("/profile/$id");
      profile = json.decode(response.data);
      print(profile);
      return profile;
    } on DioError catch (e) {
    print(e.toString());
    }
 }
 @override
  void onInit() {
    profileGetting();
    super.onInit();
  }
} 