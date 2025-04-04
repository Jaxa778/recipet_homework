import 'package:flutter/material.dart';

class ForRecipeScreenWidget extends StatelessWidget {
  final String image;
  final String name;
  final String cal;
  final String level;
  final String country;
  final String rating;
  final String ball;
  final VoidCallback onTap;
  const ForRecipeScreenWidget({
    super.key,
    required this.level,
    required this.name,
    required this.cal,
    required this.country,
    required this.ball,
    required this.image,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('$cal CAL'),
                SizedBox(width: 12),
                Text(level),
                SizedBox(width: 12),
                Text(country),
              ],
            ),
            SizedBox(height: 4),
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
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
