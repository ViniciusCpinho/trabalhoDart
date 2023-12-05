import 'package:cozinha_fora_da_caixa/api/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  final String foodId;

  DetailsScreen({required this.foodId});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<Map<String, dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/cfc/Foods/${widget.foodId}'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Falha ao carregar dados da API');
      }
    } catch (e) {
      throw Exception('Erro durante a requisição: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Map<String, dynamic>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Carregando...');
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return Text(snapshot.data!['name']);
            }
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            Map<String, dynamic> recipeData = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        recipeData["image"],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Descrição:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    recipeData["description"],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Ingredientes:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipeData["ingredients"]
                        .map<Widget>((ingredient) => Text("• $ingredient", style: TextStyle(fontSize: 16)))
                        .toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Tempo de preparo: ${recipeData["time"]}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _showLowSalaryMessage(context);
                    },
                    child: Text(
                      'Adicionar à Lista de Favoritos',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


void _showLowSalaryMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Funcionalidade não implementada'),
        content: Text('Devido ao baixo salário dos desenvolvedores esta funcionalidade ainda não foi implementada.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
