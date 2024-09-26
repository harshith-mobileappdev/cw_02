import 'package:flutter/material.dart';
import 'second-screen.dart';
import 'favorites.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}


class _HomeScreen extends State<MainScreen> {
  // Sample list of chicken snack recipes
  static const List<String> recipes = [
    'Buffalo Chicken Wings',
    'Chicken Nachos',
    'Chicken Quesadillas',
    'Chicken Satay Skewers',
    'Spicy Chicken Tenders',
    'Chicken Spring Rolls',
    'Chicken Sliders',
    'Crispy Chicken Fries',
  ];
  List<Map<String, dynamic>> details = [
    {
      'name': 'Buffalo Chicken Wings',
      'ingredients': "Chicken wings, Buffalo sauce, Butter, Celery, Blue cheese dressing",
      'instructions': 'Bake wings at 400°F for 40 mins, toss in sauce, and serve with celery and blue cheese.',
      'isFavorite' : false,
    },
    {
      'name': 'Chicken Nachos',
      'ingredients': "Tortilla chips, Shredded chicken, Cheese, Salsa, Jalapeños",
      'instructions': 'Layer chips with chicken and cheese, bake at 350°F until cheese melts, top with salsa and jalapeños.',
      'isFavorite' : false,
    },
    {
      'name': 'Chicken Quesadillas',
      'ingredients': "Tortillas, Shredded chicken, Cheese, Peppers, Onions",
      'instructions': 'Fill tortillas with chicken and cheese, grill until golden, and serve with salsa.',
      'isFavorite' : false,
    },
    {
      'name': 'Chicken Satay Skewers',
      'ingredients': '500g chicken thigh fillets, cut into pieces, 1/4 cup coconut milk 2 tablespoons soy sauce 1 tablespoon brown sugar 1 tablespoon curry powder 2 cloves garlic, minced 1 tablespoon lime juice Chopped peanuts and fresh cilantro for garnish',
      'instructions':
      'Combine coconut milk, soy sauce, brown sugar, curry powder, garlic, and lime juice. Marinate chicken for 2 hours. Grill on skewers for 10-12 mins. Garnish with peanuts and cilantro.',
      'isFavorite': false,
    },
    {
      'name': 'Spicy Chicken Tenders',
      'ingredients':  '500g chicken tenders 1 cup plain yogurt 2 tablespoons hot sauce 1 cup panko breadcrumbs 1 teaspoon smoked paprika Salt and pepper to taste',
      'instructions':
      'Mix yogurt and hot sauce. Dip tenders in mixture, then coat with breadcrumbs. Bake at 400°F for 20 mins until golden.',
      'isFavorite': false,
    },
    {
      'name': 'Chicken Sliders',
      'ingredients': '500g ground chicken 1/4 cup breadcrumbs 1/4 cup grated cheese (cheddar or your choice) 1 tablespoon Worcestershire sauce 1 teaspoon garlic powder Salt and pepper to taste Slider buns Lettuce, tomato, and any other desired toppings',
      'instructions':
      'Combine all ingredients, form patties, and cook on a skillet for 5-6 mins per side. Assemble sliders and serve.',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(details[index]['name']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: details[index],
                          id: index,
                          onFavoriteToggle: (id,isFavorite) {
                            setState(() {
                              print('setting the map');
                              details[id]= {
                                ...details[id],
                                'isFavorite': isFavorite,
                              };
                            });
                          }
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritesScreen(favoriteRecipes: details.where((recipe)=>recipe['isFavorite']).toList()),
                  ),
                );
              },
              child: const Text('View Favorites'),
            ),
          ),
        ],
      ),
    );
  }
}