import 'package:cozinha_fora_da_caixa/Pages/home/OtherReceips.dart';
import 'package:flutter/material.dart';
import 'package:cozinha_fora_da_caixa/Pages/details/DetailsScreen.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/ItensCard.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';

class HomeContent extends StatelessWidget {
  final List<GeneralFoodType> data;

  HomeContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Sabores Destaques',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...data
                          .where((item) => item.especial == true)
                          .map((item) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(foodId: item.id),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  child: ItensCard(data: item),
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          OtherRecipesSection(otherRecipes: data),
        ],
      ),
    );
  }
}
