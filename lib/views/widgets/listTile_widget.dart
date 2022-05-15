import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_navigation/styles/earnings_style.dart';
import 'package:mapbox_navigation/styles/profile_screen_style.dart';
import 'package:swipe/swipe.dart';

class ListileWidget extends StatelessWidget {
String title = '';
var func;
 var date;
 var amount;
 var color;

   ListileWidget({Key? key, required this.title, this.func,this.date,this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipe(
      onSwipeLeft: () => ZoomDrawer.of(context)!.toggle(),
      onSwipeRight: ()=>ZoomDrawer.of(context)!.toggle(),
      child: Card(

        // color: neumorphicDefaultTheme.baseColor,
        semanticContainer: false,
        elevation: 1.0,
        child: ListTile(
          
          title: Text(title,style: GoogleFonts.rubik(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18  ),),
          subtitle: Text(date== null? "": date,style: dateStyle),
          trailing: amount == null? Text("Canceled",style: amountStyle,): amount,
          onTap: (){
            func;
          },
        ),
      ),
    );
      }
}
class ListtileWidgetForPayment extends StatelessWidget {
  final title;
  final func;
  const ListtileWidgetForPayment({Key? key, required this.title, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(child: ListTile(title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),trailing: IconButton(onPressed: (){func;}, icon: Icon(Icons.arrow_forward_ios_rounded)),)),

            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300),
          ),
        );
  }
}

class ProfileListTileWidget extends StatelessWidget {
  final title;
  final trailing;
  const ProfileListTileWidget({Key? key, required this.title, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
                       title: Text(title,style:profileListtile),
                       trailing: Text(trailing ,style: profileListtile,
                       maxLines: 1,overflow: TextOverflow.ellipsis,),
                     );
  }
}