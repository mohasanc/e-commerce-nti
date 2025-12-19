import 'package:flutter/material.dart';
import 'package:products/screens/edit_profile_screen.dart';
import 'package:products/screens/login_screen.dart';
import 'package:products/screens/products_screen.dart';
import 'package:products/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/products_screen': (context) => ProductsScreen(),
        '/sign_up_screen': (context) => SignUpScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/edit_profile': (context) => EditProfile(),
      },
      initialRoute: '/login_screen',
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
