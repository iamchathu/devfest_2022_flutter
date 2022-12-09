import 'package:devfest_2022_flutter/data/cart.dart';
import 'package:devfest_2022_flutter/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noOfItems = context.watch<CartProvider>().noOfItems;
    final total = context.watch<CartProvider>().total;

    final items = context.watch<CartProvider>().items;

    void onDelete(CartItem item) =>
        context.read<CartProvider>().removeItem(item);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: noOfItems,
              itemBuilder: (context, index) {
                return CartListItem(
                  item: items.elementAt(index),
                  onDelete: onDelete,
                );
              },
            ),
          ),
          Card(
            child: Center(
              child: Text(
                total.toStringAsFixed(2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
