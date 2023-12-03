import 'package:cozinha_fora_da_caixa/Pages/home/api/home_api.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/components/detailsComponent.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/components/barButons.dart';
import 'package:cozinha_fora_da_caixa/api/api.dart';
import 'package:cozinha_fora_da_caixa/components/appbar.dart';
import 'package:flutter/material.dart';


 

class HomeScreen extends StatefulWidget {

  @override
  _WidgetHome createState() => _WidgetHome();

}
class _WidgetHome extends State<HomeScreen> {
  List data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    
    try { 
      List responseData  = await HomeApi.getAllFood();

      setState(() {
        data = responseData;
      });
    } catch (error) {
      throw Exception('Erro ao tentar pegar os dados de comida');
    }
  }

 @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: HomeAppbar(),
      body: 
        SingleChildScrollView(
          child: 
            Column(
            children: [
              DetailsComponent(
                allFoods: data
              ),
            ],
          ),
        )
      );
  }
}
