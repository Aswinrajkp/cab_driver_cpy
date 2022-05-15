import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_navigation/controllers/register&login_controller.dart';
import 'package:mapbox_navigation/requests/register_post_request.dart';

import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/details_adding/details_adding.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/login/login.dart';
import 'package:mapbox_navigation/views/otp_verification/otp_screen.dart';
import 'package:mapbox_navigation/views/register/validation_funtions.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

    TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  String? password = "";

  @override
  Widget build(BuildContext context) {
    LoginRegisterController controller = Get.put(LoginRegisterController());
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/register.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, top: 40),
                child: Text(
                  "Welcome to \nOur Service",
                  style: welcomeFont
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: 35,
                      left: 35),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: ((value) {
                            if (value == "") {
                              return "Enter Valid Username";
                            }
                          }),
                          controller: nameController,
                          decoration: InputDecoration(
                            //  label: Text("Username",style: labelFont),
                              hintText: "Enter your Username",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.length <= 9) {
                              return "Enter Valid Number";
                            }
                          },
                          controller: mobileController,
                          decoration: InputDecoration(
                            // label: Text("Mobile",style: labelFont,),
                              hintText: "Enter your Mobile ",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (validateEmail(value) == false) {
                              return "Enter Valid Email";
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            //  label: Text("Email",style: labelFont,),
                              hintText: "Enter your Email",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.length <= 4) {
                              return "Password Need Minimum 4 Numbers";
                            } else {
                              password = value;
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            //  label: Text("Password",style: labelFont),
                              hintText: "Enter your Password",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value != password) {
                              return "Password Is Not Matching";
                            }
                          },
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                            //  label: Text("Cinfirm Password",style: labelFont),
                              hintText: "confirm your Password",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                           onTap: () async {
                            if (formGlobalKey.currentState!.validate()) {
                              var name = nameController.text;
                              var password = passwordController.text;
                              var email = emailController.text;
                              var phone = mobileController.text;
                              int? id = await registerPost(
                                  name: name,
                                  password: password,
                                  email: email,
                                  phone: phone);
                              if (id != null) {
                                controller.falseState();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => DetailsAddingScreen()
                                  ),
                                );
                              } else {
                                controller.registerSetting();
                              }
                            }
                          },
                          child: Container(
                              height: 50,
                              decoration: signInDecoration,
                              child: Center(
                                  child: Text(
                                "SIGN UP",
                                style: signInText
                              ))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "new User? ",
                              style: newUserText,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.off(LoginScreen());
                                },
                                child: Text("Sign IN",
                                    style: blueSignin))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
