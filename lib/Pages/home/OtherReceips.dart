import 'package:cozinha_fora_da_caixa/Pages/details/DetailsScreen.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/ItensCard.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';
import 'package:flutter/material.dart';

class OtherRecipesSection extends StatelessWidget {
  final List<GeneralFoodType> otherRecipes;

  OtherRecipesSection({required this.otherRecipes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Outras Receitas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: otherRecipes.map((recipe) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(foodId: recipe.id),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: ItensCard(data: recipe),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
