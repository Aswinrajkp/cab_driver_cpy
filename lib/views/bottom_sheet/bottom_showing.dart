

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:mapbox_navigation/views/widgets/bottom_showing_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomShowngScreen extends StatelessWidget {
   BottomShowngScreen({Key? key}) : super(key: key);
  PanelController controller = PanelController();
  ScrollController scrollController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    NavigationController getController = Get.put(NavigationController());
    // SocketIOController socketIO = Get.put(SocketIOController());
    // return 
    // GetBuilder<SocketIOController>(
    //   builder: (socketioControll) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
           child:
          //  socketioControll.onData!= null?
          BottomShowingWidget()
          // // :
          // NoNotificationWidget(),
        );
    //   }
    // );
  }
}
