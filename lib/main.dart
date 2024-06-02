import 'package:coffee_getx/utils/app_binding.dart';
import 'package:coffee_getx/view/cart_view.dart';
import 'package:coffee_getx/view/details_view.dart';
import 'package:coffee_getx/view/home_view.dart';
import 'package:coffee_getx/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => OnBoardingView(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
        GetPage(
          name: '/details',
          page: () => DetailsView(),
        ),
        GetPage(
          name: '/cart',
          page: () => CartView(),
        ),
      ],
    );
  }
}
