import 'package:badges/badges.dart';
import 'package:devfest_2022_flutter/data/cart.dart';
import 'package:devfest_2022_flutter/data/items.dart';
import 'package:devfest_2022_flutter/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noOfItems = context.watch<CartProvider>().noOfItems;

    void onAddItem(Item item) => context.read<CartProvider>().addItem(item);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GDG Store'),
        actions: [
          IconButton(
            onPressed: () => context.push('/cart'),
            icon: Badge(
              badgeContent: Text(noOfItems.toString()),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: listOfAvailableItems.length,
          itemBuilder: (context, index) {
            return ItemTile(
              item: listOfAvailableItems.elementAt(index),
              onAddItem: onAddItem,
            );
          },
        ),
      ),
    );
  }
}
