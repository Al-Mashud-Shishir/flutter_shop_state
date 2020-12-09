import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/products.dart';
import 'package:flutter_shop_app/src/widgets/product/all.dart';
import 'package:provider/provider.dart';

enum FilterValues { all, favourite }

class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  var showFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Overview"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterValues value) {
              setState(() {
                if (value == FilterValues.favourite) {
                  showFavourites = true;
                } else {
                  showFavourites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favourites'),
                value: FilterValues.favourite,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterValues.all,
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: ProductAllGrid(showFavourites),
      ),
    );
    ;
  }
}
