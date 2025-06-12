// lib/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controller/auth_controller.dart';
import 'package:recipe_finder/views/detailedView.dart';

import '../controller/homeController.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final user = authController.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authController.logout();
              Get.offAll(const AuthWrapper());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Enter ingredients',
                helperText: "E.g Banana, Apple, Egg, Bread etc",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: controller.fetchRecipes,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else if (controller.errorMessage.value != null) {
                return Text(controller.errorMessage.value!);
              } else if (controller.recipeList.isEmpty) {
                return const Expanded(
                  child: Center(child: Text('Nothing to show.')),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.recipeList.length,
                    itemBuilder: (context, index) {
                      final recipe = controller.recipeList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailedView(
                            recipeID: recipe.id,
                            ImgUrl: recipe.image,
                            title: recipe.title, isOffline: false,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(recipe.image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    recipe.title.toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: "Poppins-Regular"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
