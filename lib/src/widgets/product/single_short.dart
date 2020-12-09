import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/cart.dart';
import 'package:flutter_shop_app/src/providers/product.dart';
import 'package:flutter_shop_app/src/widgets/product/single_detail.dart';
import 'package:provider/provider.dart';

class SingleProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we don't have to pass the product through constructor
    // it will be automatically passed through the wrapper provider
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                  value: product,
                  builder: (context, child) => SingleProductDetailView(),
                ),
              ));
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Theme.of(context).backgroundColor,
            subtitle: Text(product.description),
            leading: Consumer<Product>(
              builder: (_, value, child) => IconButton(
                icon: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  product.toggleFavourite();
                },
              ),
            ),
            trailing: Consumer<Cart>(
              builder: (_, value, child) {
                int quantity = value.getQuantity(product.id);
                if (quantity > 0) {
                  return Badge(
                    badgeContent: Text(quantity.toString()),
                    badgeColor: Theme.of(context).primaryColor,
                    position: BadgePosition.topEnd(top: -5, end: -2),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        // print(product.imageUrl);
                        cart.addItem(product.id, product.title, product.price,
                            product.imageUrl);
                      },
                    ),
                  );
                } else {
                  return IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // print(product.imageUrl);
                      cart.addItem(product.id, product.title, product.price,
                          product.imageUrl);
                    },
                  );
                }
              },
            ),
            title: Text(
              product.title,
            ),
          ),
        ),
      ),
    );
    // );
  }
}
