
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/styles/login_register_otp_style.dart';

class DetailsAddingWidget extends StatelessWidget {
  String imageText;
  String fieldText;
  var func;
   DetailsAddingWidget({Key? key, required this.imageText,required this.fieldText,required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: Icon(Icons.add_a_photo_rounded),onPressed: (){
                },),
              ),
              Text(imageText,style: GoogleFonts.kanit(fontSize: 16),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: TextFormField(
                          decoration: InputDecoration(
                              hintText: fieldText,
                              border: textfieldBorder),
                        ),
          ),
        ],
      ),
    );
  }
}