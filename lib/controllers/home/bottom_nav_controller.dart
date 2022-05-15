import 'package:get/state_manager.dart';

class BottomNavController extends GetxController{
  var currentIndex =0;

  changeBottomIndex(index){
       currentIndex = index;
       update();
       print(currentIndex);
  }
 
 

}