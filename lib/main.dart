
import 'package:cozinha_fora_da_caixa/Pages/home/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cozinha Fora da Caixa',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


