import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:swipe/swipe.dart';

class AppbarWidget extends StatelessWidget {

  final String title;
  final leading;
  const AppbarWidget({Key? key, required this.title,  this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipe(
      onSwipeLeft: () => ZoomDrawer.of(context)!.toggle(),
      onSwipeRight: ()=>ZoomDrawer.of(context)!.toggle(),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: leading,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
    );
  }
}