import 'dart:convert';

import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_navigation/controllers/map_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIOController extends GetxController {
  var check;
  var error;
  var sendData;
  var driverinfo;
  String pinVerification = "";

  late io.Socket socket;

  socketConnect() async {
    print("Entered");
    socket = io.io("https://cab-hub1.herokuapp.com/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();

    socket.onConnect((data) {
      check = data;
    });

    socket.on("data", (data) {
      // check = data;
      sendData = data;

     
      print("+++++++++++++++++++++++++$pinVerification");
      // LatLng(latitude, longitude)

      getController.destinationHandler(
        LatLng(
          sendData["pickupcordinate"][0],
          sendData["pickupcordinate"][1],
        ),
      );
      print("--------------------------------The dara ${data.toString()}");
      update();
    });

    socket.onError((data) {
      error = data;
    });
    return sendData;
  }

  socketConfirm(String id) {
    

    print("Entered");
    print('+++++++++++++++++++++++++++++${socket.connected}');
    print('IDDDDDDDDDDDDDDDDDDDDDD $id');
    socket.emit("confirmation", 
      sendData
    );
    driverinfo = id;
    update();
    print("/?????????????????????After emit $id");

     
   if (pinVerification.length != 4) {
      for(int i =0; i< 4 ; i++){
        pinVerification += sendData["userId"][i];
      }
   } 
    
  }

  // @override
  // void dispose() {
  // sendData;
  //   super.dispose();
  // }

}
