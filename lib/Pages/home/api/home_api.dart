import 'dart:convert';

import 'package:cozinha_fora_da_caixa/api/api.dart';
import 'package:http/http.dart' as http;

class HomeApi {

  static Future <List<dynamic>> getAllFood() async {
    print('HomeApi');
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      print('response --> ${response.body}');
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      } else {
        print('Erro na requisição: ${response.statusCode}');
        print('Corpo da resposta: ${response.body}');
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (error) {
      print('Na foi possivel enviar a requisição: $error');
      throw Exception('Erro na requisição: $error');
    }
  }
}