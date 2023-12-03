

import 'package:cozinha_fora_da_caixa/api/FoodApi.dart';
import 'package:cozinha_fora_da_caixa/components/appbar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {

  String foodId = '';

  DetailsScreen({required this.foodId});

  @override
  _WidgetDetails createState() => _WidgetDetails(foodId: foodId);
}

class _WidgetDetails extends State<DetailsScreen> {

  dynamic data = [];
  String foodId = '';

  _WidgetDetails({required this.foodId});

  @override
  void initState() {
    super.initState();

  }

  Future<void> loadData() async { 
    try {
      print('Valor de foodId: ${widget.foodId}');
      print('Tipo de foodId: ${widget.foodId.runtimeType}');
      List responseData = await FoodApi.getFood(foodId);
    
      setState(() {
        data: responseData;
      });
    } catch (error) {
      throw Exception('Erro! Não foi possivel carregar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(),
      body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Text('teste'),
            ]),
        ),
    );
  }
}