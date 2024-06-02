import 'package:coffee_getx/utils/fake_data(coffee).dart';
import 'package:coffee_getx/model/coffee.dart';
import 'package:get/get.dart';

class CoffeeController extends GetxController {
  List<Coffee> coffeeList =
      fakeData['data']!.map((json) => Coffee.fromJson(json)).toList();
  RxList<Coffee> cartList = <Coffee>[].obs;
  RxInt quantity = RxInt(1);
  RxDouble opacity = RxDouble(0.0);

  void addToCart(Coffee item) {
    if (cartList.any((element) => element == item)) {
      return;
    }
    item.quantity = quantity.value;
    cartList.add(item);
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value == 1) {
      return;
    }
    quantity.value--;
  }

  void increaseQuantityOfItem(Coffee item) {
    item.quantity++;
    update();
  }

  void decreaseQuantityOfItem(Coffee item) {
    if (item.quantity == 1) {
      return;
    }
    item.quantity--;
    update();
  }

  void removeItem(Coffee item) {
    cartList.remove(item);
  }
}
