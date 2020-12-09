import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/product.dart';
import 'package:provider/provider.dart';

class SingleProductDetailView extends StatefulWidget {
  @override
  _SingleProductDetailViewState createState() =>
      _SingleProductDetailViewState();
}

class _SingleProductDetailViewState extends State<SingleProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(product.description),
            Text(product.isFavourite.toString())
          ],
        ),
      ),
    );
  }
}
