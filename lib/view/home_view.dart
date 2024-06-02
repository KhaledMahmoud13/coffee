import 'package:coffee_getx/controller/coffee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin {
  CoffeeController controller = Get.find<CoffeeController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        controller.opacity.value = 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.toNamed('/cart'),
                child: const Icon(
                  Icons.sort,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'It\'s a Great Day for Coffee',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Find your coffee',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TabBar(
            controller: TabController(length: 3, vsync: this),
            dividerHeight: 0,
            labelStyle: TextStyle(color: Colors.orange[700], fontSize: 16),
            unselectedLabelStyle:
                const TextStyle(color: Colors.grey, fontSize: 16),
            indicatorColor: Colors.orange[700],
            indicatorPadding: const EdgeInsets.only(bottom: -8),
            tabs: const [
              Text('Hot Coffee'),
              Text('Cold Coffee'),
              Text('Cappuiccino'),
            ],
          ),
          const SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemCount: controller.coffeeList.length,
            itemBuilder: (context, index) => Obx(
              () => AnimatedOpacity(
                duration: Duration(milliseconds: 900 * index),
                opacity: controller.opacity.value,
                child: InkWell(
                  onTap: () => Get.toNamed('/details',
                      arguments: controller.coffeeList[index]),
                  child: Card(
                    elevation: 1,
                    color: const Color(0xFF212325),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/${controller.coffeeList[index].image}',
                              width: 120,
                              height: 120,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.coffeeList[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.coffeeList[index].subTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${controller.coffeeList[index].price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.orange[700],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          elevation: 50,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color(0xFF212325),
          unselectedItemColor: Colors.white,
          fixedColor: Colors.orange[700],
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Person',
            ),
          ],
        ),
      ),
    );
  }
}
