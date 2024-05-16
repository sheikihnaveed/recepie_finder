
import 'package:recipe_finder/network/apiCall.dart';

import '../models/getAnalyzedInstructions.dart';
import '../models/getIngredients.dart';
import '../models/getNutrients.dart';
import '../utilities/constants.dart';

class AppLogic {
  final apicall apiCall = apicall();

  late List<GetAnalyzedInstructions> analyzedInstructions = [];
  late List<Ingredient> ingredients = [];
  late List<Nutrient> nutrients = [];

  AppLogic() {
    analyzedInstructions = [];
    ingredients = [];
    nutrients = [];
  }

  Future<void> getInstructions(int recipeID) async {
    var url = '$recipeID/$getAnalyzedRecipeInstructions?&apiKey=$apiKey';
    var response = await apiCall.getData(url).catchError((err) {});
    if (response == null) return;

    analyzedInstructions = getAnalyzedInstructionsFromJson(response);

    if (analyzedInstructions.isEmpty) {
      print("No steps found");
    }
  }

  Future<void> getIngredients(int recipeID) async {
    var url = '$recipeID/$ingredient?&apiKey=$apiKey';
    var response = await apiCall.getData(url).catchError((err) {});
    if (response == null) return;

    GetIngredients parsedIngredients = getIngredientsFromJson(response);
    ingredients = parsedIngredients.ingredients;
  }

  Future<void> getNutrients(int recipeID) async {
    var url = '$recipeID/$nutrition?&apiKey=$apiKey';
    var response = await apiCall.getData(url).catchError((err) {});
    if (response == null) return;

    final Getnutrients = getnutrientsFromJson(response);
    nutrients = Getnutrients.nutrients;
  }
}
