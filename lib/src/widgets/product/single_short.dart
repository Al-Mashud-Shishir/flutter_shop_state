import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/products_provider.dart';
import 'package:flutter_shop_app/src/widgets/product/single_detail.dart';
import 'package:provider/provider.dart';

class SingleProductView extends StatelessWidget {
  final String id;

  SingleProductView({this.id});

  @override
  Widget build(BuildContext context) {
    final productsRef = Provider.of<ProductsProvider>(context);
    final singleProduct = productsRef.productById(id);

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
                builder: (context) => SingleProductDetailView(
                  id: singleProduct.id,
                ),
              ));
            },
            child: Image.network(
              singleProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Theme.of(context).backgroundColor,
            subtitle: Text(singleProduct.description),
            leading: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            title: Text(
              singleProduct.title,
            ),
          ),
        ),
      ),
    );
  }
}
