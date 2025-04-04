import 'package:flutter/material.dart';
import 'package:recipet_homework/models/recipe_model.dart';

class LastScreen extends StatelessWidget {
  final RecipeModel recipeModel;
  const LastScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.network(recipeModel.image, fit: BoxFit.cover),
            ),
            Text(recipeModel.name),
            Row(
              children: [
                Text(recipeModel.mealType[0]),
                Text(recipeModel.difficulty),
                Text(recipeModel.cuisine),
                Text("${recipeModel.caloriesPerServing.toString()} Cal"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star_half, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text('4,6 (95)'),
              ],
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...recipeModel.ingredients.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    const Text("• "),
                    Flexible(child: Text(ingredient)),
                  ],
                ),
              ),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Instructions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...recipeModel.instructions.asMap().entries.map((entry) {
              final index = entry.key;
              final instruction = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${index + 1}. "),
                    Expanded(child: Text(instruction)),
                  ],
                ),
              );
            }),
            Divider(),
            ListTile(
              title: Text("Prep time"),
              subtitle: Text("${recipeModel.prepTimeMinutes} minutes"),
            ),
            Divider(),
            ListTile(
              title: Text("Cook time"),
              subtitle: Text("${recipeModel.cookTimeMinutes} minutes"),
            ),
            Divider(),
            ListTile(
              title: Text("Servings"),
              subtitle: Text(recipeModel.servings.toString()),
            ),
            Divider(),
            ListTile(
              title: Text("Difficulty"),
              subtitle: Text(recipeModel.difficulty),
            ),
            Divider(),
            ListTile(
              title: Text("Cuisine"),
              subtitle: Text(recipeModel.cuisine),
            ),
            Divider(),
            ListTile(
              title: Text("Tags"),
              subtitle: Column(
                children: [
                  ...recipeModel.tags.asMap().entries.map((entry) {
                    final index = entry.key;
                    final tag = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${index + 1}. "),
                          Expanded(child: Text(tag)),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
