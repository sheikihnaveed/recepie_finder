import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/components/Ingredients.dart';
import 'package:recipe_finder/components/Nutrients.dart';
import 'package:recipe_finder/components/Instructions.dart';
import 'package:recipe_finder/controller/detailed_view_controller.dart';

class DetailedView extends StatelessWidget {
  final int recipeID;
  final String title;
  final String ImgUrl;
  final bool isOffline;

  DetailedView({
    required this.recipeID,
    required this.ImgUrl,
    required this.title,
    required this.isOffline,
  });

  final DetailedViewController controller = Get.put(DetailedViewController());

  @override
  Widget build(BuildContext context) {
    if (isOffline == true) {
      controller.fetchOfflineRecipe(recipeID);
    } else {
      controller.fetchAllData(recipeID);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Screen",
          style: TextStyle(fontFamily: "Poppins-Regular"),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final ingredients = isOffline == true
            ? controller.ingredientsOffline.value
            : controller.ingredients.map((e) => e.name).toList();

        final nutrients = isOffline == true
            ? controller.nutrientsOffline.value
            : controller.nutrients
            .map((e) => "${e.name}: ${e.amount}${e.unit}")
            .toList();

        final instructions = isOffline == true
            ? controller.instructionsOffline.value
            : controller.instructions
            .expand((e) => e.steps)
            .map((e) => "${e.number}. ${e.step}")
            .toList();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: isOffline
                        ? const AssetImage("assets/images/logo.png") as ImageProvider<Object>
                        : NetworkImage(ImgUrl) as ImageProvider<Object>,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins-Regular",
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Prep Time: 30 mins | Cook Time: 45 mins',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontFamily: "Poppins-Regular",
                ),
              ),
              const SizedBox(height: 16.0),

              if (isOffline != true)
                ElevatedButton.icon(
                  onPressed: () async {
                    await controller.saveRecipeOffline(
                      id: recipeID,
                      title: title,
                      imageUrl: ImgUrl,
                      ingredients: controller.ingredients,
                      nutrients: controller.nutrients,
                      instructions: controller.instructions,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Recipe saved offline")),
                    );
                  },
                  icon: const Icon(Icons.save, color: Colors.white,),
                  label: const Text("Save Offline"),
                ),
              const SizedBox(height: 16.0),
              Ingredients(
                onlineData: controller.ingredients,
                offlineData: controller.ingredientsOffline,
                isOffline: isOffline ?? false,
              ),


              const SizedBox(height: 16.0),
              Nutrients(
                isOffline: isOffline ?? false,
                onlineData: controller.nutrients,
                offlineData: controller.nutrientsOffline,
              ),

              const SizedBox(height: 16.0),
              Instructions(
                isOffline: isOffline ?? false,
                onlineData: controller.instructions,
                offlineData: controller.instructionsOffline,
              ),


            ],
          ),
        );
      }),
    );
  }
}
