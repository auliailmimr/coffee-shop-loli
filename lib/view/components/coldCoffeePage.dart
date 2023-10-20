import 'package:coffee_shop/model/coffeeModel.dart';
import 'package:coffee_shop/view/components/menuItemcard.dart';
import 'package:flutter/material.dart';

class ColdCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hotMenu = menu.where((item) => item.type == "Hot").toList();
    final coldMenu = menu.where((item) => item.type == "Cold").toList();

    return Container(
      child: ListView.builder(
        itemCount: coldMenu.length,
        itemBuilder: (context, int index) {
          return MenuItemCard(index: index+hotMenu.length, menuItem: coldMenu[index]);
        },
      ),
    );
  }
}
