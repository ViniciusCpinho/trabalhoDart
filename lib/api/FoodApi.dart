import 'dart:convert';

import 'package:cozinha_fora_da_caixa/Pages/home/types/FoodType.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';
import 'package:cozinha_fora_da_caixa/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodApi{

  static Future <List<generalFoodTypes>> getAllFood() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/cfc/Foods'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<generalFoodTypes> foodList = data.map((item) {
        return generalFoodTypes(
          createdAt: item['createdAt'],
          name: item['name'],
          ocasiao: item['ocasiao'],
          avaliation: item['avaliation'],
          country: item['country'],
          especial: item['especial'],
          image: item['image'],
          description: item['description'],
          time: item['time'],
          id: item['id'],
        );
      }).toList();

      return foodList;

      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro na requisição: $error');
    }
  }

  static Future <List<foodType>> getFood(id) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/cfc/Food${id}'));

      if (response.statusCode == 200){
        List<dynamic> data = jsonDecode(response.body);

        List<foodType> food = data.map((item) => 
          foodType(
            name: item['name'],
            ocasiao: item['ocasiao'],
            avaliation: item['avaliation'],
            country: item['country'],
            image: item['image'],
            description: item['description'],
            ingredients: item['ingredients'],
            time: item['time'],
            id: item['id'],
          )
        ).toList();

        return food;
      } else {
        throw Exception('Erro na requisição do item: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro na requisição: $error');
    }
  }
}