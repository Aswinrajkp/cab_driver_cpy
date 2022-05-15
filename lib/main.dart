import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';
import 'package:mapbox_navigation/views/splash.dart/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IdStoring.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
