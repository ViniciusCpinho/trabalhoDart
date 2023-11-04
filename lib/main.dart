import 'package:cozinha_fora_da_caixa/domain/home/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage()
      },
    )
  );
}