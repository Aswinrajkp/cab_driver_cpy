import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/styles/bottom_sheet_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/after_confirming.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/navigation/map.dart';

class BottomShowingWidget extends StatelessWidget {
  const BottomShowingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController getController =Get.put(NavigationController());
    return Column(
        children: [
         Text("User Ready For Ride ",style: userready,),
         SizedBox(height: 20,),
         Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Text('''From :''',style: information,),
           Text("${sendData.toString()}",style: information,)
         ],),
         SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: NeumorphicButton(
                pressed: false,
                // onPressed: () => vehicleInformations(),
                onPressed: (){
                // socketIO.tripConfirmation();
                },
                
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
                    ),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: NeumorphicButton(
                pressed: false,
                onPressed: ()async {
                  // await getController.userCurrentLocationButtonHandler();
                    // await getController.lastResponseGetting(context);
                    // getController.initailizeDirectionResponse();
                           Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MainScreen(
                              widget: AfterConfirmScreen(),
                              height: .13,)));
                         },
                style: NeumorphicStyle(
                  border: const NeumorphicBorder(width: 1),
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                ),
                child: Text(
                  "Confirm",
                  style: GoogleFonts.josefinSans(
                        fontSize: 18, fontWeight: FontWeight.w600,color: Colors.green),
                ),
              ),
                     ),
                    
                 ],
               )
        ],
      );
  }
}