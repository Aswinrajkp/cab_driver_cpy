import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/styles/bottom_sheet_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/after_completing_ride.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';

class AfterRideStartsScreen extends StatelessWidget {
  const AfterRideStartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocketIOController socketIO = Get.put(SocketIOController());
    return Container(
      child: GetBuilder<SocketIOController>(
        builder: (socketIO) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("From :",style: afterinformations,),
                  Expanded(child: Text("${socketIO.sendData["location1"]}",style: afterinformations,))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("      To :",style: afterinformations,),
                  Text("${socketIO.sendData["location2"]}",style: afterinformations,)
                ],
              ),
              SizedBox(height: 20,),
            
              SizedBox(height: 20,),
                     NeumorphicButton(
                    pressed: false,
                    onPressed: (){
                      getController.lastResponseGetting(context);
                  Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MainScreen(
                              widget: AfterCompletingScreen(),
                              height: .31,
                              )));
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
          );
        }
      ),
    );
  }
}
