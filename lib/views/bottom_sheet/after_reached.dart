import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/styles/bottom_sheet_style.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/after_ride-start.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/navigation/map.dart';

class AfterReachedScreen extends StatelessWidget {
   AfterReachedScreen({Key? key}) : super(key: key);

TextEditingController pinController = TextEditingController();
final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SocketIOController socketIO = Get.put(SocketIOController());
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100,right: 100,bottom: 16),
            child: Form(
              key: formKey,
              child: TextFormField(
                            controller: pinController,
                               validator: (pin){
                               if(pin != socketIO.pinVerification){
                                  return "The pin is incurrect";
                               }
                               },
                            decoration: InputDecoration(
                              
                                hintText: "Enter User Pin",
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                border: textfieldBorder),
                          ),
            ),
          ),
                      NeumorphicButton(
                pressed: false,
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                  getController.lastResponseGetting(context);
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MainScreen(
                          widget: AfterRideStartsScreen(),
                          height: .30,
                          )));
   } },
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