import 'dart:convert';
import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapbox_navigation/controllers/details/details_controller.dart';
import 'package:mapbox_navigation/requests/driver_details_post_request.dart';
import 'package:mapbox_navigation/styles/details_adding_style.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/tab_navigation/tabbar.dart';
import 'package:menu_button/menu_button.dart';
import 'package:mapbox_navigation/views/details_adding/validator.dart';

class DetailsAddingScreen extends StatelessWidget {

  DetailsAddingScreen({Key? key}) : super(key: key);

  List<String> keys = <String>['Auto', 'Mini', 'Sedan', "XUV"];
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController rcNumberController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    return Container(
      color: neumorphicDefaultTheme.baseColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: GetBuilder<DetailsController>(
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text("Welcome", style: welcomeText)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Let's give some valuable informations",
                                style: afterWelcomeText),
                            Text("About you and your vehicle",
                                style: afterWelcomeText)
                          ],
                        ),
                      ),
                      GetBuilder<DetailsController>(builder: (controller) {
                        return MenuButton<String>(
                          itemBackgroundColor: neumorphicDefaultTheme.baseColor,
                          child: normalChildButton,
                          items: keys,
                          itemBuilder: (String value) => Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16),
                            child: Text(value),
                          ),
                          toggledChild: Container(
                            child: normalChildButton,
                          ),
                          onItemSelected: (String value) {
                            controller.changingLabel(value);
                          },
                          onMenuButtonToggle: (bool isToggle) {
                            print(isToggle);
                          },
                        );
                      }),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.vehiclePhoto == null?
                                  IconButton(
                                    icon: Icon(Icons.add_a_photo_rounded),
                                    onPressed: () async {
                                      XFile? photo = await ImagePicker()
                                          .pickImage(source: ImageSource.gallery);
                                      if (photo == null) {
                                        return;
                                      }
                                      controller.vehicleImageAdding(photo);
                                    },
                                  ):
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundImage: MemoryImage(controller.vehiclePhoto!),
                                  )
                                ),
                                Text(
                                  "Click here for add your vehicle photo",
                                  style: GoogleFonts.kanit(fontSize: 16),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: vehicleNumberController,
                                validator: ((number) {
                                  bool verified = vehicleNumberValidation(number);
                                  if (verified == false) {
                                    return "Enter the currect vehicle number";
                                  }
                                }),
                                decoration: InputDecoration(
                                    label: Text("Vehicle Number"),
                                    hintText: "KL __ AB ____",
                                    border: textfieldBorder),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.rcBookPhoto == null?
                                  IconButton(
                                    icon: Icon(Icons.add_a_photo_rounded),
                                    onPressed: () async {
                                      XFile? photo = await ImagePicker()
                                          .pickImage(source: ImageSource.gallery);
                                      if (photo == null) {
                                        return;
                                      }
                                     controller.rcBookImageAdding(photo);
                                     
                                    },
                                  ):
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundImage: MemoryImage(controller.rcBookPhoto!),
                                  )
                                ),
                                Text(
                                  "Click here for add your rc book photo",
                                  style: GoogleFonts.kanit(fontSize: 16),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: rcNumberController,
                                decoration: InputDecoration(
                                    hintText: "Enter your rc book number",
                                    border: textfieldBorder),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.licencePhoto == null?
                                  IconButton(
                                    icon: Icon(Icons.add_a_photo_rounded),
                                    onPressed: () async {
                                      XFile? photo = await ImagePicker()
                                          .pickImage(source: ImageSource.gallery);
                                      if (photo == null) {
                                        return;
                                      }
                                      controller.licenceImageAdding(photo);
                                    },
                                  ):
                                    CircleAvatar(
                                    radius: 18,
                                    backgroundImage: MemoryImage(controller.licencePhoto!),
                                  )
                                ),
                                Text(
                                  "Click here for add your licence photo",
                                  style: GoogleFonts.kanit(fontSize: 16),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextFormField(
                                controller: licenceNumberController,
                                decoration: InputDecoration(
                                    hintText: "Enter your licence number",
                                    border: textfieldBorder),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "The given details will be check and verified",
                          style: afterWelcomeText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: (() async {
                            final vehicle = controller.selectedKey;
                            final vehicleNumber = vehicleNumberController.text;
                            final rcNumber = rcNumberController.text;
                            final licenceNumber = licenceNumberController.text;
                        int? result=  await detailsAddingPost(vehicleType: vehicle, vehicleImage: controller.vehicleImage, vehicleNumber: vehicleNumber, rcBookImage: controller.rcBookImage, rcbookNumber: rcNumber, drivingLicenceImage: controller.licenceImage, drivingLicenceNumber: licenceNumber);
                            if(result == 200){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Tabbar()));
                            }
                          }),
                          child: Container(
                            child:
                                Center(child: Text("Begin Now", style: beginfont)),
                            height: 42,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      )),
    );
  }

  final Widget normalChildButton = Container(
    color: neumorphicDefaultTheme.baseColor,
    width: 190,
    height: 40,
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(child: GetBuilder<DetailsController>(builder: (controller) {
            return Text(
              controller.selectedKey == null
                  ? "Vehicle Type"
                  : "${controller.selectedKey}",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.kanit(fontSize: 19),
            );
          })),
          FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
              size: 100,
            ),
          ),
        ],
      ),
    ),
  );
}
