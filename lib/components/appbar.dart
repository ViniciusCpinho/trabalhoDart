import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70); // Ajuste conforme necessário

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset('logo/Logo.png'),
      backgroundColor: Color.fromARGB(255, 117, 176, 156),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 900,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Pesquisar...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: 70,
    );
  }
}
