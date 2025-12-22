import 'package:flutter/material.dart';
import 'package:products/features/Add_Product/Presentation/Screens/add_product_screen.dart';
import 'package:products/features/Profile/Presentation/Screens/edit_profile_screen.dart';
import 'package:products/features/Auth/Presentation/Screens/login_screen.dart';
import 'package:products/features/Home/Presentation/Screens/products_screen.dart';
import 'package:products/features/Auth/Presentation/Screens/sign_up_screen.dart';

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
        '/add_product': (context) => AddProductScreen(),
        '/sign_up_screen': (context) => SignUpScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/edit_profile': (context) => EditProfile(),
      },
      initialRoute: '/sign_up_screen',
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
