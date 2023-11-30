import 'package:cozinha_fora_da_caixa/Pages/home/components/barButons.dart';
import 'package:cozinha_fora_da_caixa/components/appbar.dart';
import 'package:flutter/material.dart';


  class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: HomeAppbar(),
      body: Container(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 243, 243, 243),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeButtonComponent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
