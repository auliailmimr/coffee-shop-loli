import 'package:coffee_shop/model/coffeeModel.dart';
import 'package:coffee_shop/view/components/menuItemcard.dart';
import 'package:flutter/material.dart';

class OrtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotMenu = menu.where((item) => item.type == "Hot").toList();
    final coldMenu = menu.where((item) => item.type == "Cold").toList();
    final foodMenu = menu.where((item) => item.type == "Food").toList();
    final int other = hotMenu.length + coldMenu.length;

    return Container(
      child: ListView.builder(
        itemCount: foodMenu.length,
        itemBuilder: (context, int index) {
          return MenuItemCard(index: index + other, menuItem: foodMenu[index]);
        },
      ),
    );
  }
}