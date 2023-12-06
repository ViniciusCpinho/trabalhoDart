import 'package:cozinha_fora_da_caixa/Pages/details/DetailsScreen.dart';
import 'package:cozinha_fora_da_caixa/Pages/home/types/generalFoodType.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<GeneralFoodType> data;

  CustomAppBar({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(data),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomSearchDelegate extends SearchDelegate {
  final List<GeneralFoodType> data;

  CustomSearchDelegate(this.data);

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
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<GeneralFoodType> filteredList = data.where((item) => item.name.contains(query)).toList();

    if (filteredList.isEmpty) {
      return Center(
        child: Text("Item não encontrado"),
      );
    } else {
      return ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredList[index].name),
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<GeneralFoodType> filteredList = data.where((item) => item.name.contains(query)).toList();

    if (filteredList.isEmpty) {
      return Center(
        child: Text("Item não encontrado"),
      );
    } else {
      return ListView.builder(
        itemCount: filteredList.length > 5 ? 5 : filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredList[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(foodId: filteredList[index].id),
                ),
              );
            },
          );
        },
      );
    }
  }
}
