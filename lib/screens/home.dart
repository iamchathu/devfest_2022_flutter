import 'package:badges/badges.dart';
import 'package:devfest_2022_flutter/data/cart.dart';
import 'package:devfest_2022_flutter/data/items.dart';
import 'package:devfest_2022_flutter/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Cart cart;

  @override
  void initState() {
    super.initState();
    cart = Cart();
  }

  void onAddItem(Item item) {
    setState(() {
      cart.addItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDG Store'),
        actions: [
          IconButton(
            onPressed: () => context.push('/cart'),
            icon: Badge(
              badgeContent: Text(cart.noOfItems.toString()),
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
