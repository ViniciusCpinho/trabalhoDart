import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  BarButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed(),
        child: Text(
          label,
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
      ),
    );
  }
}

class HomeButtons extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BarButton(
          label: 'Receitas',
          onPressed: () {
            // Lógica quando o botão "Receitas" é pressionado
          },
        ),
        BarButton(
          label: 'Regiões',
          onPressed: () {
            // Lógica quando o botão "Regiões" é pressionado
          },
        ),
        BarButton(
          label: 'Ingredientes',
          onPressed: () {
            // Lógica quando o botão "Ingredientes" é pressionado
          },
        ),
        BarButton(
          label: 'Ocasiões',
          onPressed: () {
            // Lógica quando o botão "Ocasiões" é pressionado
          },
        ),
        BarButton(
          label: 'Instruções',
          onPressed: () {
            // Lógica quando o botão "Instruções" é pressionado
          },
        ),
      ],
    );
  }
}
