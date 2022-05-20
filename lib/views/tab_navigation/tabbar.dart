import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_navigation/helpers/socket_io.dart';
import 'package:mapbox_navigation/requests/profile_get_request.dart';
import 'package:mapbox_navigation/views/bottom_sheet/bottom_showing.dart';
import 'package:mapbox_navigation/views/earnings/earnings_screen.dart';
import 'package:mapbox_navigation/views/home/home_screen.dart';
import 'package:mapbox_navigation/views/profile/profile_screen.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
SocketIOController socketIO = Get.put(SocketIOController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socketIO.socketConnect();
  }



  @override
  Widget build(BuildContext context) {
    ProfileGettingController profile = Get.put(ProfileGettingController());
   
    profile.profileGetting();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.map),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.history),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.person),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MainScreen(widget: BottomShowngScreen(), height: .31),
              EarningsScreen(),
              ProfileScreen()
            ],
          ),
        ));
  }
}
