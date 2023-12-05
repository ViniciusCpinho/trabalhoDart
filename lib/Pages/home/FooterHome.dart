
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        children: [
          Text(
            '© 2023 Cozinha Fora da Caixa. Todos os direitos reservados.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  // Adicione ação para abrir a página do Facebook, se aplicável.
                },
              ),
              IconButton(
                icon: Icon(Icons.square),
                onPressed: () {
                  // Adicione ação para abrir a página do Twitter, se aplicável.
                },
              ),
              IconButton(
                icon: Icon(Icons.square),
                onPressed: () {
                  // Adicione ação para abrir a página do Instagram, se aplicável.
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
