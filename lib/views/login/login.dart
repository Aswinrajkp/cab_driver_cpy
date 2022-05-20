import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mapbox_navigation/controllers/register&login_controller.dart';
import 'package:mapbox_navigation/requests/login_post_request.dart';

import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/details_adding/details_adding.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/otp_verification/number_entering.dart';
import 'package:mapbox_navigation/views/register/register_screen.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';
import 'package:mapbox_navigation/views/register/validation_funtions.dart';
import 'package:mapbox_navigation/views/tab_navigation/tabbar.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final globalformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginRegisterController controller = Get.put(LoginRegisterController());
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50, top: 130),
                child: Text(
                  "Welcome \n back",
                  style: welcomeFont
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.45,
                      right: 35,
                      left: 35),
                  child: Form(
                    key: globalformKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: (value){
                            if(validateEmail(value) == false){
                               return "Enter Valid Email";
                             }
                          },
                          decoration: InputDecoration(
                              // label: Text(
                              //   "Username",
                              //   style: labelFont
                              // ),
                              hintText: "Enter your Email",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                           validator: (value){
                            if(value == null){
                               return "Enter Password";
                             }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              // label: Text(
                              //   "Password",
                              //   style: labelFont
                              // ),
                              hintText: "Enter your Password",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()async {
                           if (globalformKey.currentState!.validate()) {
                             var email = emailController.text;
                             var password = passwordController.text;
                        int? loginstate = await loginPost(email: email , password: password);
                        print(loginstate );
                            if(loginstate == 200){
                              controller.falseState();
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Tabbar()));
                            }
                          // else{
                          //   controller.loginSetting();
                          // }
                           }
                          },
                          child: Container(
                              height: 50,
                              decoration: signInDecoration,
                              child: Center(
                                  child: Text(
                                "SIGN IN",
                                style: signInText
                              ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("------or-------"),
                        ),
                        GestureDetector(
                          onTap: (() => Get.to(NumberEnteringScreen()) ),
                          child: Image(
                              height: 50,
                              image: AssetImage("assets/images/login singn.png")),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "new User? ",
                              style: newUserText
                            ),
                            TextButton(
                                onPressed: () {
                                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> RegisterScreen()));
                                },
                                child: Text("Sign Up",
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
