import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:recipe_finder/controller/appLogic.dart';
import 'package:recipe_finder/models/RecipeOfflineModel.dart';
import 'package:recipe_finder/models/getNutrients.dart';
import 'package:recipe_finder/models/getAnalyzedInstructions.dart';
import 'package:recipe_finder/models/getIngredients.dart';

class DetailedViewController extends GetxController {
  final AppLogic appLogic = AppLogic();

  var isLoading = false.obs;

  // Observables for offline fallback
  RxList<String> ingredientsOffline = <String>[].obs;
  RxList<String> nutrientsOffline = <String>[].obs;
  RxList<String> instructionsOffline = <String>[].obs;

  // Fetch from API
  Future<void> fetchAllData(int recipeID) async {
    isLoading.value = true;

    await appLogic.getIngredients(recipeID);
    await appLogic.getInstructions(recipeID);
    await appLogic.getNutrients(recipeID);

    isLoading.value = false;
  }

  // Getters for online data
  List<Ingredient> get ingredients => appLogic.ingredients;
  List<Nutrient> get nutrients => appLogic.nutrients;
  List<GetAnalyzedInstructions> get instructions => appLogic.analyzedInstructions;

  /// Save recipe to Isar DB (offline)
  Future<void> saveRecipeOffline({
    required int id,
    required String title,
    required String imageUrl,
    required List<Ingredient> ingredients,
    required List<Nutrient> nutrients,
    required List<GetAnalyzedInstructions> instructions,
  }) async {
    final isar = Isar.getInstance();

    final recipe = RecipeOfflineModel()
      ..recipeId = id
      ..title = title
      ..imageUrl = imageUrl
      ..ingredients = ingredients.map((e) => "${e.name} ${e.amount.us.value} - ${e.amount.us.unit}").toList()
      ..nutrients = nutrients
          .map((e) => "${e.name} ${e.amount} - ${e.unit}")
          .toList()
      ..instructions = instructions
          .expand((element) => element.steps)
          .map((e) => e.step)
          .toList();

    await isar?.writeTxn(() async {
      await isar.recipeOfflineModels.put(recipe);
    });
  }

  /// Fetch recipe from offline storage
  Future<void> fetchOfflineRecipe(int recipeId) async {
    isLoading.value = true;

    final isar = Isar.getInstance();
    final recipe = await isar?.recipeOfflineModels
        .filter()
        .recipeIdEqualTo(recipeId)
        .findFirst();

    if (recipe != null) {
      ingredientsOffline.value = recipe.ingredients;
      nutrientsOffline.value = recipe.nutrients;
      instructionsOffline.value = recipe.instructions;
    }

    isLoading.value = false;
  }
}
