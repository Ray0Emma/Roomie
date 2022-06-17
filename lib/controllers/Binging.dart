import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'commandeController.dart';



class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put(comandeContrller(),permanent: true);

  }


}