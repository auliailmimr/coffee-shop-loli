// import 'package:coffee_shop/view/pages/homePage.dart';
import 'package:coffee_shop/view/pages/homePage.dart';
import 'package:coffee_shop/view/pages/login.dart';
import 'package:coffee_shop/view/pages/menu.dart';
import 'package:coffee_shop/view/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // home: HomePage(),
      // home: Login(),
    );
  }
}
