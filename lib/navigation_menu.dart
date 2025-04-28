import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/utilities/colors.dart';
import 'package:recipe_finder/views/homeScreen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: CColors.secondary, // Background color
          indicatorColor: CColors.softGrey, // Selected item background
          // overlayColor: WidgetStateProperty.all(Colors.blue.withOpacity(0.2)), // Ripple effect
          iconTheme: WidgetStateProperty.all(
             IconThemeData(color: CColors.primary), // White icon color
          ),
          labelTextStyle: WidgetStateProperty.all(
            Theme.of(context).textTheme.labelLarge!,
          ),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded square effect
          ),
        ),
        child: Obx(
          () => NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.dining_sharp),
                label: "Saved",
              ),
              NavigationDestination(
                icon: Icon(Icons.health_and_safety),
                label: "Diseases",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }


}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
     HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen(),
    // const PaymentHistoryScreen(),
    // const HelpScreen(),
    // const AccountsScreen()
  ];
}
