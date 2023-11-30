
import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Voltar para a tela anterior
            Navigator.pop(context);
          },
          child: Text('Voltar para a Página Inicial'),
        ),
      ),
    );
  }
}