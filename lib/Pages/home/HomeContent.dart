

import 'package:cozinha_fora_da_caixa/Pages/details/DetailsScreen.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/ItensCard.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {

  final List data;
  final String title;

  HomeContent({required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: 300,
              height: 60,
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              child: Text(
                    '${title}',
                    style: TextStyle(
                      color: Colors.white ,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            child: Row(
              children: [
                ...data.where((item) => item.especial == true).map((item) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(foodId: item.id),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: ItensCard(data: item),
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}