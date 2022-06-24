import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'HomeController.dart';
import 'MapsController.dart';
import 'RoomeDetails.dart';
import 'commandeController.dart';



class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put(comandeContrller(),permanent: true);
    Get.put(roomeiDetails(),permanent: true);
    Get.put(homeController(),permanent: true);
    Get.put(mapsControlller());
  }


}