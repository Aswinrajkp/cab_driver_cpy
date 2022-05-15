import 'package:flutter/material.dart';
import 'package:mapbox_navigation/styles/earnings_style.dart';
import 'package:mapbox_navigation/views/widgets/appbar_widget.dart';
import 'package:mapbox_navigation/views/widgets/listTile_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      // backgroundColor:neumorphicDefaultTheme.baseColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("History",style:myEarningTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                     height: size.height*.12 ,
                    width: size.width*.37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                    ),
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Weakly",
                            style: earningsTime
                          ),
                          Text(
                            "4000",
                            style: earningsTime
                          )
                        ],
                      ),
                    
                  ),
                  Container(
                    height: size.height*.12 ,
                    width: size.width*.37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                    ),
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "monthly",
                            style: earningsTime
                          ),
                          Text(
                            "40000",
                            style: earningsTime
                          )
                        ],
                      ),
                  )
                ],
              )),

          ListileWidget(
            title: "From to ",

            date: "27/7/22",
            amount: Text("₹300"),
          ),
          ListileWidget(
            title: "From to ",
            date: "27/7/22",
            amount: Text("₹400"),
          ),
          ListileWidget(
            title: "From to ",
         
            date: "27/7/22",
            amount: Text("₹500"),
          )
        ],
      ),
    );
  }
}
