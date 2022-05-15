import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/views/bottom_sheet/after_reached.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';

class AfterConfirmScreen extends StatelessWidget {
  const AfterConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        // Icon(Icons.message,color: Colors.black,size: 35,), 
       NeumorphicButton(
                pressed: false,
              
                style: NeumorphicStyle(
                  border: const NeumorphicBorder(width: 1),
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                ),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.josefinSans(
                        fontSize: 18, fontWeight: FontWeight.w600,color: Colors.red),
                ),
              ),
              NeumorphicButton(
                pressed: false,
                onPressed: (){
                  getController.lastResponseGetting(context);
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MainScreen(
                          widget: AfterReachedScreen(),
                          height: .22,
                          )));
            },
                style: NeumorphicStyle(
                  border: const NeumorphicBorder(width: 1),
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                ),
                child: Text(
                  "Reached",
                  style: GoogleFonts.josefinSans(
                        fontSize: 18, fontWeight: FontWeight.w600,color: Colors.green),
                ),
              ),
       
        ],
      ),
    ));
  }
}
