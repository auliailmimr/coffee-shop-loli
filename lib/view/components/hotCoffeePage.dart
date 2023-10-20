import 'package:coffee_shop/model/coffeeModel.dart';
import 'package:flutter/material.dart';

import 'menuItemcard.dart';

class HotCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filter menu items berdasarkan jenis "hot"
    final hotMenu = menu.where((item) => item.type == "Hot").toList();

    return Container(
      child: ListView.builder(
        itemCount: hotMenu.length,
        itemBuilder: (context, int index) {
          return MenuItemCard(index: index, menuItem: hotMenu[index]);
        },
      ),
    );
  }
}
