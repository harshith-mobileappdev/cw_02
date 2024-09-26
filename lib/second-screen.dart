import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key,required this.recipe, required this.id, required this.onFavoriteToggle});
  final Function(int, bool) onFavoriteToggle;
  final int id;
  final Map<String, dynamic> recipe;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}
class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite=false;

  @override
  void initState() {
    super.initState();// Initialize with the recipe's favorite status
    isFavorite=widget.recipe['isFavorite'];
  }

  void toggleFavorite() {
    setState(() {
      isFavorite=!isFavorite;
      widget.onFavoriteToggle(widget.id, isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name']!),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(widget.recipe['ingredients']!),
                const SizedBox(height: 16),
                const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(widget.recipe['instructions']!),
              ],
            ),
          ),
          const Expanded(child: SizedBox()), // Spacer to push button down
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
