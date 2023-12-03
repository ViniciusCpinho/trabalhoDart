
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Color.fromRGBO(243, 243, 243, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Café da Manhã',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'images/Chicken_Omelet.jpg',
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('Chicken Omelet'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('10 min |'),
              Icon(Icons.star),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsComponent extends StatelessWidget {
  final List allFoods;

  DetailsComponent({required this.allFoods});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sabores Destaques',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsCard(),
                DetailsCard(),
                DetailsCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
