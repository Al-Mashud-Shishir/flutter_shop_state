import 'package:flutter/material.dart';
import 'package:flutter_shop_app/src/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartRef = Provider.of<Cart>(context);
    final cartItems = cartRef.items;
    List<CartItem> cartItemsList = [];
    cartItems.forEach((k, v) => cartItemsList.add(CartItem(
        id: k,
        price: v.price,
        productTitle: v.productTitle,
        quantity: v.quantity,
        imageUrl: v.imageUrl)));
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: cartItemsList.length > 0
            ? Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: SizedBox(
                          width: 50,
                          child: Image.network(
                            cartItemsList[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          cartItemsList[index].productTitle,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline2.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          "Price: " +
                              cartItemsList[index].price.toString() +
                              " Quantity: " +
                              cartItemsList[index].quantity.toString(),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline2.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                color: Colors.red[700],
                                icon: Icon(Icons.delete),
                                onPressed: () =>
                                    Provider.of<Cart>(context, listen: false)
                                        .deleteItem(cartItemsList[index].id),
                              ),
                              IconButton(
                                color: Colors.deepOrange,
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () => Provider.of<Cart>(context,
                                        listen: false)
                                    .deleteQuantity(cartItemsList[index].id),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      trailing: Chip(
                        elevation: 5,
                        backgroundColor: Theme.of(context).buttonColor,
                        padding: EdgeInsets.all(8),
                        label: Text(
                          "Total : " + cartRef.totalPrice.toStringAsFixed(2),
                          style: TextStyle(
                            // color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Text(
                'No items in the cart',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline2.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
      ),
    );
    ;
  }
}
