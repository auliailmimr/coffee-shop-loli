import 'package:coffee_shop/model/coffeeLoliModel.dart';
import 'package:coffee_shop/model/fetch_data_coffee.dart';
import 'package:coffee_shop/view/components/menuItemcard.dart';
import 'package:flutter/material.dart';

class OtherCoffeePage extends StatelessWidget {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: repo.fetchData(),
      builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Text('Error: Gagal mengambil data');
        } else {
          List<CoffeeLoli> menu = [];

          // Konversi setiap item dalam snapshot.data menjadi objek CoffeeLoli
          for (var item in snapshot.data!) {
            menu.add(CoffeeLoli.fromJson(item));
          }

          // Pisahkan menu berdasarkan jenisnya
          final hotMenu = menu.where((item) => item.type == "Hot").toList();
          final coldMenu = menu.where((item) => item.type == "Cold").toList();
          final otherMenu = menu.where((item) => item.type == "Other").toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tampilan HotMenu
              Text(
                'Hot Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: hotMenu.length,
                  itemBuilder: (context, int index) {
                    return MenuItemCard(
                      index: index,
                      menuItem: hotMenu[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Tampilan ColdMenu
              Text(
                'Cold Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
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

              // Tampilan OtherMenu
              Text(
                'Other Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: otherMenu.length,
                  itemBuilder: (context, int index) {
                    return MenuItemCard(
                      index: index + hotMenu.length + coldMenu.length,
                      menuItem: otherMenu[index],
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
