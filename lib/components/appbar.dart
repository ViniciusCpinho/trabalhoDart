
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function(String) onSearch;

  CustomAppBar({required this.title, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate(onSearch));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Function(String) onSearch;

  CustomSearchDelegate(this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Center(
      child: Text('Resultados para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implemente aqui sugestões de pesquisa enquanto o usuário digita
    return Center(
      child: Text('Digite para buscar'),
    );
  }
}