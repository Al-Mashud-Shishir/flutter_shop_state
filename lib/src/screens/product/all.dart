import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/models/product.dart';
import 'package:flutter_shop_app/src/widgets/product/all.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Overview"),
      ),
      body: Center(
        child: ProductAllGrid(),
      ),
    );
    ;
  }
}
