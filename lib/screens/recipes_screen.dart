import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/mock_service.dart';
import '../widgets/widgets.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockService();

  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
