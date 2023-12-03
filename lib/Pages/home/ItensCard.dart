import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';
import 'package:flutter/material.dart';

class ItensCard extends StatelessWidget {
  final generalFoodTypes data;

  ItensCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  data.ocasiao == 'AlmoÃ§o' ? 'Almoço' : data.ocasiao,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontFamily: 'utf-8'),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
                data.image, // Acesse a propriedade específica do objeto generalFoodTypes
                width: 250,
                height: 200,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(data
                .name), // Acesse a propriedade específica do objeto generalFoodTypes
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '${data.avaliation} min |'), // Certifique-se de que 'data.avaliacao' está correto
              ...List<Widget>.generate(
                data.avaliation,
                (index) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
