import 'package:flutter/material.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  var widget;
  final ScrollController controller;
  final PanelController panelController ;
   PanelWidget({Key? key, required this.panelController, required this.controller,required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300
                  ),
                ),
              ),
            ),
           widget
        ],
      ),
    );
  }
  
}