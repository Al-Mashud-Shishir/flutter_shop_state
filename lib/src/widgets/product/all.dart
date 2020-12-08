import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/products_provider.dart';
import 'package:flutter_shop_app/src/widgets/product/single_short.dart';
import 'package:provider/provider.dart';

class ProductAllGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productsRef = Provider.of<ProductsProvider>(context);
    var products = productsRef.products;
    return GridView.builder(
      padding: EdgeInsets.all(12.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.2,
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 12.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => SingleProductView(
        id: products[index].id,
      ),
    );
  }
}
