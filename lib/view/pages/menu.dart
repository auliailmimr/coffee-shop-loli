import 'package:coffee_shop/view/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/model/coffeeModel.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan saat ikon di footer ditekan
  final List<Widget> _pages = <Widget>[
    // Halaman pertama
    CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Coffee Shop",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            background: Image.asset(
              "assets/header.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              MenuSlider(
                menu: menu,
                title: "Menu Kami",
              ),
              MenuSlider(
                menu: menu,
                title: "Discount Oktober",
                customImages: [
                  "assets/promo1.png",
                  "assets/promo2.png",
                  "assets/promo3.jpg",
                  "assets/promo4.jpg",
                ],
                titles: [
                  "Promo Oktober",
                  "Promo Dine In",
                  "Promo Membership",
                  "Promo Surprise",
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    // Halaman kedua
    Container(
      // Ganti dengan halaman yang diinginkan
      child: Center(
        child: Text("Halaman Kedua"),
      ),
    ),
    // Halaman ketiga
    Container(
      // Ganti dengan halaman yang diinginkan
      child: Center(
        child: Text("Halaman Ketiga"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[
          _selectedIndex], // Menampilkan halaman sesuai dengan _selectedIndex

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Our Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Fungsi yang dipanggil saat ikon ditekan
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Jika ikon "Our Menu" ditekan (index 1), navigasi ke halaman Our Menu
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

class MenuSlider extends StatelessWidget {
  final List<Coffee> menu;
  final List<String> customImages;
  final List<String> titles;
  final String title;
  final double imageHeight;

  MenuSlider({
    required this.menu,
    required this.title,
    this.customImages = const [],
    this.titles = const [],
    this.imageHeight = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Lihat Semua",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          customImages.isNotEmpty && customImages.length > index
                              ? customImages[index]
                              : menu[index].image,
                          height: imageHeight,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        titles.isNotEmpty && titles.length > index
                            ? titles[index]
                            : menu[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
