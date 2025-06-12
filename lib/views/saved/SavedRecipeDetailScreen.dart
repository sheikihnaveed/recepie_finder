// lib/views/saved_recipe_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:recipe_finder/models/RecipeOfflineModel.dart';

class SavedRecipeDetailScreen extends StatelessWidget {
  final RecipeOfflineModel recipe;

  const SavedRecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(recipe.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            const Text("Ingredients", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ...recipe.ingredients.map((e) => Text("- $e")).toList(),

            const SizedBox(height: 20),
            const Text("Nutrients", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ...recipe.nutrients.map((e) => Text("- $e")).toList(),

            const SizedBox(height: 20),
            const Text("Instructions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ...recipe.instructions.map((e) => Text("- $e")).toList(),
          ],
        ),
      ),
    );
  }
}
