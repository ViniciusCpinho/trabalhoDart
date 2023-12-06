import 'package:cozinha_fora_da_caixa/Pages/home/FooterHome.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/HomeContent.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/ItensCard.dart';
import 'package:cozinha_fora_da_caixa/api/FoodApi.dart';
  import 'package:cozinha_fora_da_caixa/api/api.dart';
import 'package:cozinha_fora_da_caixa/components/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _WidgetHome createState() => _WidgetHome();
}

class _WidgetHome extends State<HomeScreen> {
  dynamic data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      List responseData = await FoodApi.getAllFood();

      setState(() {
        data = responseData;
      });
    } catch (error) {
      throw Exception('Erro! Não foi possivel carregar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Cozinha Fora da Caixa',
          data: data,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            HomeContent(data: data),
            Footer(),
          ],
        )));
  }
}
