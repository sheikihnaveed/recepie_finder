// lib/controller/home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/models/getRecipe.dart';
import 'package:recipe_finder/network/apiCall.dart';
import 'package:recipe_finder/utilities/constants.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxList<GetRecipe> recipeList = <GetRecipe>[].obs;
  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  final apicall api = apicall();

  void fetchRecipes() async {
    final searchText = searchController.text;
    if (searchText.trim().isEmpty) return;

    final url = '$findByIngredients?ingredients=$searchText&apiKey=$apiKey';

    isLoading.value = true;
    errorMessage.value = null;

    try {
      final response = await api.getData(url);
      recipeList.value = getRecipeFromJson(response);
    } catch (_) {
      errorMessage.value = 'Error fetching data';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
