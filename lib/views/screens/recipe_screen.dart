import 'package:flutter/material.dart';
import 'package:recipet_homework/controllers/recipe_controller.dart';
import 'package:recipet_homework/models/recipe_model.dart';
import 'package:recipet_homework/views/screens/last_screen.dart';
import 'package:recipet_homework/views/widgets/for_recipe_screen_widget.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final recipeController = RecipeController();
  final searchController = TextEditingController();
  List<RecipeModel> recipeDate = [];
  List<RecipeModel> filteredRecipes = [];
  bool isLoading = false;

  Future<void> getRecipeDate() async {
    isLoading = true;
    final result = await recipeController.getRecipe();
    recipeDate = result;
    filteredRecipes = result;
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getRecipeDate();
  }

  void filterRecipes(String query) {
    final results =
        recipeDate.where((recipe) {
          return recipe.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

    setState(() {
      filteredRecipes = results;
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recipes"),
        TextField(
          controller: searchController,
          onChanged: (value) {
            return filterRecipes(value);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return ForRecipeScreenWidget(
                    level: recipe.difficulty,
                    name: recipe.name,
                    cal: recipe.caloriesPerServing.toString(),
                    country: recipe.cuisine,
                    ball: recipe.reviewCount.toString(),
                    image: recipe.image,
                    rating: recipe.rating.toStringAsFixed(1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LastScreen(recipeModel: recipe);
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: filteredRecipes.length,
              ),
            ),
      ],
    );
  }
}
