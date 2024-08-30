import 'package:ecommerce/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
    child: Builder(builder: (BuildContext context)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    }),
    );
  }
}