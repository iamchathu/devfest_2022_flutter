import 'package:devfest_2022_flutter/data/cart.dart';
import 'package:devfest_2022_flutter/data/items.dart';
import 'package:devfest_2022_flutter/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  // remove this with state.
  final Cart _cart = Cart.withValues(listOfAvailableItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cart.noOfItems,
              itemBuilder: (context, index) {
                return CartListItem(item: _cart.items.elementAt(index));
              },
            ),
          ),
          Card(
            child: Center(
              child: Text(
                _cart.total.toStringAsFixed(2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
