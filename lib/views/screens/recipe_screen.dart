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
  bool isLoading = false;

  Future<void> getRecipeDate() async {
    isLoading = true;
    final result = await recipeController.getRecipe();
    recipeDate = result;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getRecipeDate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recipes"),
        TextField(decoration: InputDecoration(border: OutlineInputBorder())),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ForRecipeScreenWidget(
                    level: recipeDate[index].difficulty,
                    name: recipeDate[index].name,
                    cal: recipeDate[index].caloriesPerServing.toString(),
                    country: recipeDate[index].cuisine,
                    ball: recipeDate[index].reviewCount.toString(),
                    image: recipeDate[index].image,
                    rating: recipeDate[index].rating.toStringAsFixed(1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LastScreen(
                              rm: recipeDate[index],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: recipeDate.length,
              ),
            ),
      ],
    );
  }
}
