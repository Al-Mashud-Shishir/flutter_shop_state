import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/products_provider.dart';
import 'package:flutter_shop_app/src/screens/product/all.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AllProductsScreen(),
      ),
    );
  }
}
