import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/controllers/profile/profile_controller.dart';
import 'package:mapbox_navigation/requests/profile_get_request.dart';
import 'package:mapbox_navigation/styles/profile_screen_style.dart';
import 'package:mapbox_navigation/views/widgets/appbar_widget.dart';
import 'package:mapbox_navigation/views/widgets/listTile_widget.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    ProfileGettingController profile = Get.put(ProfileGettingController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: SingleChildScrollView(
              child: GetBuilder<ProfileGettingController>(
                builder: (profile) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        
                        fit: StackFit.loose,
                        // overflow: Overflow.visible,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              color: Colors.black,
                            ),
                            height: size.height * .29,
                          ),
                          Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                "My\nProfile",
                                style: myProfile,
                              )),
                          Positioned(
                              top: 135,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                color: NeumorphicTheme.baseColor(context),
                                elevation: 10,
                                child: Container(
                                  height: size.height * .2,
                                  width: size.width * .79,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * .06,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${profile.profile["name"]}",
                                          style: profileTitle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Positioned(
                              child: CircleAvatar(
                                                  radius: size.width * .17,
                                                  backgroundImage: NetworkImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/002/275/847/small/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"),
                                                )),
                        ],
                      ),
                      SizedBox(
                        height: size.height*.10,
                      ),
                     Card(
                       color: Colors.transparent,
                       child: Container(width: size.width*.79,height: 100,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Today's Trip",style: profileListtile,),
                               Text("0",style: profileListtile,),
                             ],
                           ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Total Trips",style: profileListtile,),
                               Text("0",style: profileListtile,),
                             ],
                           )
                         ],
                       )
                       ),),
                     SizedBox(height: 5,),
                      GetBuilder<ProfileController>(
                        builder: (controller) {
                          return SingleChildScrollView(
                            child: 
                            // controller.detailsShowing?
                            Column(
                              children: [
                                ProfileListTileWidget(
                                  title: "Mobile Number",
                                  trailing: "${profile.profile["phone"]}",
                                ),
                                ProfileListTileWidget(
                                    title: "Email",
                                    trailing: "${profile.profile["email"]}"),
                                    ProfileListTileWidget(
                                    title: "Licence Number", trailing: "12345586090"),
                                    ProfileListTileWidget(
                                    title: "Vehicle Number", trailing: "kl 58 WE 3215"),
                                    ProfileListTileWidget(
                                    title: "Rc Number", trailing: "ke23558938"),
                                ProfileListTileWidget(
                                    title: "Password", trailing: "*********"),
                                    SizedBox(height: size.height*.05,),
                                     NeumorphicButton(
                                                     
                                                    pressed: false,
                                                    onPressed: ()=>controller.changeDetails(),
                                                    style: NeumorphicStyle(
                                                      border: const NeumorphicBorder(
                                                          width: 1),
                                                      shape: NeumorphicShape.flat,
                                                      boxShape: NeumorphicBoxShape.beveled(
                                                          BorderRadius.circular(5)),
                                                    ),
                                                    child: Text(
                                                      "Edit Details",
                                                      style: GoogleFonts.josefinSans(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                   
                                                  ),
            
                              ],
                            )
                          );
                        }
                      )
                    ],
                  );
                }
              ),
            )));
  }
}