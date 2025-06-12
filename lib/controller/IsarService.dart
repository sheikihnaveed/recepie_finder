import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_finder/models/RecipeOfflineModel.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [RecipeOfflineModelSchema],
      directory: dir.path,
        inspector: true
    );
  }

  Future<void> saveRecipe(RecipeOfflineModel recipe) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.recipeOfflineModels.put(recipe);
    });
  }

  Future<List<RecipeOfflineModel>> getSavedRecipes() async {
    final isar = await db;
    return await isar.recipeOfflineModels.where().findAll();
  }

  Future<void> deleteRecipe(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.recipeOfflineModels.delete(id);
    });
  }
}
