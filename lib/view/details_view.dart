import 'package:coffee_getx/controller/coffee_controller.dart';
import 'package:coffee_getx/model/coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  CoffeeController controller = Get.find<CoffeeController>();

  @override
  void dispose() {
    super.dispose();
    controller.quantity.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    Coffee args = Get.arguments;

    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      body: ListView(
        padding: const EdgeInsets.all(24),
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
          const SizedBox(height: 80),
          Image.asset('assets/${args.image}'),
          const SizedBox(height: 40),
          Text(
            args.subTitle.toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white60,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            args.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey[700]!,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => controller.decreaseQuantity(),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Obx(
                      () => Text(
                        '${controller.quantity}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    InkWell(
                      onTap: () => controller.increaseQuantity(),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$ ${args.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            args.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white60,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Volume: 60 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: MaterialButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () => controller.addToCart(args),
                  color: Colors.grey[850],
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 70),
              Flexible(
                flex: 1,
                child: MaterialButton(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide.none,
                  ),
                  onPressed: () {},
                  color: Colors.orange[700],
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
