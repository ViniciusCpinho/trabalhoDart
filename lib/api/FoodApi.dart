import 'dart:convert';

import 'package:cozinha_fora_da_caixa/Pages/home/types/foodType.dart';
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

  Future<Map<String, dynamic>> foodById(int id) async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/cfc/Foods/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }
}