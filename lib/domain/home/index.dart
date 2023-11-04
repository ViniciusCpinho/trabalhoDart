
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha AppBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ação quando o ícone de pesquisa é pressionado.
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              print('Botão de pesquisa clicado');
              // Ação quando o ícone de menu é pressionado.
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Conteúdo da Página'),
      ),
    );
  }
}