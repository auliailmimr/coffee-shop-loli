import 'package:coffee_shop/view/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/firebase_options.dart';
import 'package:coffee_shop/model/coffeeLoliModel.dart';
import 'package:coffee_shop/model/fetch_data_coffee.dart';
import 'package:coffee_shop/view/pages/detaiPage.dart';
import 'package:coffee_shop/view/pages/homePage.dart';
import 'package:coffee_shop/view/pages/login.dart';
import 'package:coffee_shop/view/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffee_shop/model/coffeeModel.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                isGestureEnabled: true,
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
                isGestureEnabled: false,
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
    ListView(
      children: <Widget>[
        Container(
          height: 200,
          child: Image.asset(
            "assets/affogato.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profil"),
          onTap: () {
            // Navigasi ke halaman profil di sini
          },
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Loli Coffee and Bites",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple, // Perbaiki nama Colors
        actions: [
          InkWell(
            onTap: () async {
              await _auth.signOut(); // Logout pengguna
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: _pages[
          _selectedIndex], // Menampilkan halaman sesuai dengan _selectedIndex

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: 'Our Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0, // Indeks aktif ketiga adalah Profil
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
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
  Repository repo = Repository();
  final List<Coffee> menu;
  final List<String> customImages;
  final List<String> titles;
  final String title;
  final double imageHeight;
  final bool
      isGestureEnabled; // Tambahkan parameter untuk menentukan apakah GestureDetector ditampilkan

  MenuSlider({
    required this.menu,
    required this.title,
    this.customImages = const [],
    this.titles = const [],
    this.imageHeight = 120,
    this.isGestureEnabled = true, // Default is true
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: repo.fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
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
                    if (isGestureEnabled)
                      Text(
                        "",
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
                    return isGestureEnabled
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    index: index,
                                    menuItem: snapshot.data[index],
                                  ),
                                ),
                              );
                            },
                            child: buildMenuCard(index, snapshot),
                          )
                        : buildMenuCard(index, snapshot);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget buildMenuCard(int index, AsyncSnapshot snapshot) {
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
              height: 20,
            ),
            Text(
              titles.isNotEmpty && titles.length > index
                  ? titles[index]
                  : snapshot.data[index].name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
