import 'dart:convert';
import 'dart:typed_data';

import 'package:get/state_manager.dart';

class DetailsController extends GetxController {
  String? selectedKey;
  String? vehicleImage;
  String? rcBookImage;
  String? licenceImage;
  Uint8List? vehiclePhoto;
  Uint8List? rcBookPhoto;
  Uint8List? licencePhoto;
  changingLabel(value) {
    selectedKey = value;
    update();
    print(selectedKey);
  }

  vehicleImageAdding(photo) async {
    final imageBytes = await photo.readAsBytes();
    vehicleImage = base64Encode(imageBytes);
    vehiclePhoto = base64Decode(vehicleImage!);
    update();
  }

  rcBookImageAdding(photo) async {
    final imageBytes = await photo.readAsBytes();
    rcBookImage = base64Encode(imageBytes);
    rcBookPhoto = base64Decode(rcBookImage!);
    update();
  }

  licenceImageAdding(photo) async {
    final imageBytes = await photo.readAsBytes();
    licenceImage = base64Encode(imageBytes);
    licencePhoto = base64Decode(licenceImage!);
    update();
  }
}
