import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/models/product.dart';
import 'package:flutter_shop_app/src/providers/products_provider.dart';
import 'package:provider/provider.dart';

class SingleProductDetailView extends StatefulWidget {
  final String id;

  SingleProductDetailView({this.id});

  @override
  _SingleProductDetailViewState createState() =>
      _SingleProductDetailViewState();
}

class _SingleProductDetailViewState extends State<SingleProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final productsRef = Provider.of<ProductsProvider>(context);
    final singleProduct = productsRef.productById(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(singleProduct.title),
      ),
      body: Center(
        child: Text(singleProduct.description),
      ),
    );
    ;
  }
}
