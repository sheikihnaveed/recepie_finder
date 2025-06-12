import 'package:isar/isar.dart';

part 'RecipeOfflineModel.g.dart';

@Collection()
class RecipeOfflineModel {
  Id id = Isar.autoIncrement;

  late int recipeId;
  late String title;
  late String imageUrl;

  List<String> ingredients = [];
  List<String> nutrients = [];
  List<String> instructions = [];
}
