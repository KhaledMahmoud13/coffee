import 'package:coffee_getx/controller/coffee_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CoffeeController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) => Card(
                color: const Color(0xFF212325),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/${controller.cartList[index].image}',
                        width: 70,
                        height: 70,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.cartList[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '\$ ${controller.cartList[index].price}',
                              style: const TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          controller.decreaseQuantityOfItem(
                                              controller.cartList[index]),
                                      child: const Icon(
                                        Icons.arrow_circle_down,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    GetBuilder<CoffeeController>(
                                      builder: (coffeeController) {
                                        return Text(
                                          '${controller.cartList[index].quantity}',
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    InkWell(
                                      onTap: () =>
                                          controller.increaseQuantityOfItem(
                                              controller.cartList[index]),
                                      child: const Icon(
                                        Icons.arrow_circle_up,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => controller
                                      .removeItem(controller.cartList[index]),
                                  child: const Icon(
                                    CupertinoIcons.trash_circle,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
