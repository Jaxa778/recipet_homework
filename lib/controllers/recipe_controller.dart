import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipet_homework/models/recipe_model.dart';

class RecipeController {
  Future<List<RecipeModel>> getRecipe() async {
    final link = "https://dummyjson.com/recipes";

    final url = Uri.parse(link);

    final response = await http.get(url);

    final decodedRecipe = jsonDecode(response.body);

    final List<RecipeModel> recipeData = [];

    for (var data in decodedRecipe["recipes"]) {
      recipeData.add(RecipeModel.fromMap(data));
    }
    return recipeData;
  }
}
