import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/cart.dart';
import 'package:flutter_shop_app/src/providers/products.dart';
import 'package:flutter_shop_app/src/screens/product/all.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: AllProductsScreen(),
      ),
    );
  }
}
