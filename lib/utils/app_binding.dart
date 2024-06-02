import 'package:coffee_getx/controller/coffee_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CoffeeController());
  }
}
