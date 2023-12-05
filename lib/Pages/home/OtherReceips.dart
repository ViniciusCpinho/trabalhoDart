
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
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ItensCard(data: recipe),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
