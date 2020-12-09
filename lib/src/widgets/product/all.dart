import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/products.dart';
import 'package:flutter_shop_app/src/widgets/product/single_short.dart';
import 'package:provider/provider.dart';

class ProductAllGrid extends StatelessWidget {
  var showFavourites;

  ProductAllGrid(this.showFavourites);

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, value, child) {
      var products =
          this.showFavourites ? value.favouriteProducts : value.products;
      return GridView.builder(
        padding: EdgeInsets.all(12.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.2,
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 12.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: SingleProductView(),
        ),
      );
      // can access provider data using "value" parameter
    });
  }
}
