import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/styles/bottom_sheet_style.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/tab_navigation/tabbar.dart';

class AfterCompletingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final SocketIOController socketIOController =
        Get.find<SocketIOController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Waiting For Payment", style: findingvehicle),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NeumorphicProgressIndeterminate(),
              )
            ],
          ),
          NeumorphicButton(
            pressed: false,
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //         builder: (ctx) => Tabbar()));

           socketIOController.sendData = null;              

              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Tabbar()), (route) => false);
            },
            style: NeumorphicStyle(
              border: const NeumorphicBorder(width: 1),
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
            ),
            child: Text(
              "Ok",
              style: GoogleFonts.josefinSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
