// lib/views/saved_recipes_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:recipe_finder/models/RecipeOfflineModel.dart';
import 'package:recipe_finder/views/detailedView.dart';

import 'SavedRecipeDetailScreen.dart';

class SavedRecipesScreen extends StatefulWidget {
  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  late Future<List<RecipeOfflineModel>> savedRecipes;

  @override
  void initState() {
    super.initState();
    savedRecipes = loadSavedRecipes();
  }

  Future<List<RecipeOfflineModel>> loadSavedRecipes() async {
    final isar = Isar.getInstance();
    return await isar?.recipeOfflineModels.where().findAll() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Recipes")),
      body: FutureBuilder<List<RecipeOfflineModel>>(
        future: savedRecipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final recipes = snapshot.data ?? [];

          if (recipes.isEmpty) {
            return const Center(child: Text("No saved recipes."));
          }

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/logo.png",
                        width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(recipe.title),
                    subtitle: Text("Recipe ID: ${recipe.recipeId}"),
                    onTap: () {
                      // Navigate to detailed screen with recipe data
                      Get.to(
                        () => DetailedView(
                          recipeID: recipe.recipeId,
                          ImgUrl: recipe.imageUrl,
                          title: recipe.title,
                          isOffline: true,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
