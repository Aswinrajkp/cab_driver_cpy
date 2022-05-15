import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Currently no user available for ride",style:GoogleFonts.josefinSans(fontSize: 25,fontWeight: FontWeight.w700)),
        Lottie.asset("assets/lottie/104439-gps-pointer.json"),
      ],
    );
  }
}