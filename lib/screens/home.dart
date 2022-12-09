import 'package:badges/badges.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDG Store'),
        actions: [
          IconButton(
            onPressed: () => context.push('/cart'),
            icon: Badge(
              badgeContent: Text('0'),
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
            return ItemTile(item: listOfAvailableItems.elementAt(index));
          },
        ),
      ),
    );
  }
}
