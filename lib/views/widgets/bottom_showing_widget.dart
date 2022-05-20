import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/helpers/shared_preferences.dart';
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
    SocketIOController socketIO = Get.put(SocketIOController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
          children: [
           Text("User Ready For Ride ",style: userready,),
           SizedBox(height: 20,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text('''From :''',style: information,),
             Expanded(child: Text("${socketIO.sendData["location1"]}",style: information,))
           ],),
           SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text('''To :''',style: information,),
             Expanded(child: Text("                 ${socketIO.sendData["distance"]}/km",style: information,))
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
                  Navigator.of(context).pop();
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
                    print("On press worked============================");
                    String id =await IdStoring.getId();
                    // await getController.userCurrentLocationButtonHandler();
                    //   await getController.lastResponseGetting(context);
                      // getController.initailizeDirectionResponse();
                      print("before socket emit");
                       socketIO.socketConfirm(id);

                      

                             Navigator.of(context).pushReplacement(MaterialPageRoute(
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
        ),
    );
  }
}