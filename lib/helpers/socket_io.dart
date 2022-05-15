import 'dart:convert';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

late io.Socket socket;

var check ;
var error;
var sendData;

void socketConnect() async {
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
    print("--------------------------------The dara ${data.toString()}");
 
  });
  
  socket.onError((data) {
    error = data;
  });
}
//   socket.onConnect((_) {
//     var message = {
//       "_id": vehicleId,
//       "location": location,
//       "userId": userId,
//       "cordinates": pickup,
//   };

//     print('On connect is working ');
//     socket.emit("message", message);
//   });

 

//   socket.on("connect_error", (data) => {
//      print(" this is the error of socket io $data")
//     });

//   socket.on('driver_info', (data) {
//     AvailableVehicleInformation availableVehicleInformation = Get.put(AvailableVehicleInformation());
//     availableVehicleInformation.idAssigning(data);
//     availableVehicleInformation.gettingAvailableVehicleDetails(data);
//   });

//   print("The socket.io data VehicleId:$vehicleId");
//   print("The socket.io data location:$location");
//   print("The socket.io data userId:$userId");
// }
