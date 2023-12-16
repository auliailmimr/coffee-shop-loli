// ignore_for_file: must_be_immutable

import 'package:coffee_shop/model/coffeeLoliModel.dart';
import 'package:coffee_shop/model/fetch_data_coffee.dart';
import 'package:coffee_shop/view/components/menuItemcard.dart';
import 'package:flutter/material.dart';

class ColdCoffeePage extends StatelessWidget {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: repo.fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Text('Error: Gagal mengambil data');
        } else {
          List<CoffeeLoli> menu = snapshot.data;

          // Konversi setiap item dalam snapshot.data menjadi objek CoffeeLoli
          // for (var item in snapshot.data!) {
          //   menu.add(CoffeeLoli.fromJson(item));
          // }

          final hotMenu = menu.where((item) => item.type == "Hot").toList();
          final coldMenu = menu.where((item) => item.type == "Cold").toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tampilan HotMenu
                Text(
                  '\t\t\t\tCold Menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: coldMenu.length,
                    itemBuilder: (context, int index) {
                      return MenuItemCard(
                        index: index + hotMenu.length,
                        menuItem: coldMenu[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        }
      },
    );
  }
}
