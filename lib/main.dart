import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_add_to_cart/provider.dart';
import 'package:task_add_to_cart/screens/cart_screen.dart';
import 'package:task_add_to_cart/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_)=>CartProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(),
      routes: { CartScreen.rouatName: (_) => CartScreen(),
        HomeScreen.routName: (_)=>HomeScreen(),
      }
    );
  }
}
