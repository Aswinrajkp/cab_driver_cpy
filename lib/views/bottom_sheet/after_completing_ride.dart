import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/styles/bottom_sheet_style.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/tab_navigation/tabbar.dart';

class AfterCompletingScreen extends StatelessWidget {
  const AfterCompletingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CheckboxListTile(
  title: Text("Paypal",style: paymentText),
    value: true,
  onChanged: (newValue) {
   
  },
  controlAffinity: ListTileControlAffinity.trailing,  
),
           CheckboxListTile(
  title: Text("Razorpay",style: paymentText),
    value: true,
  onChanged: (newValue) {
   
  },
  controlAffinity: ListTileControlAffinity.trailing,  
),
           CheckboxListTile(
  title: Text("Cash",style: paymentText),
    value: true,
  onChanged: (newValue) {
   
  },
  controlAffinity: ListTileControlAffinity.trailing,  
),
                      NeumorphicButton(
                pressed: false,
                onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => Tabbar()));
            },
                style: NeumorphicStyle(
                  border: const NeumorphicBorder(width: 1),
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                ),
                child: Text(
                  "Ok",
                  style: GoogleFonts.josefinSans(
                        fontSize: 18, fontWeight: FontWeight.w600,color: Colors.green),
                ),
              ),
        ],
      ),
    );
  }
}