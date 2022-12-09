import 'package:devfest_2022_flutter/data/items.dart';
import 'package:flutter/material.dart';

class Cart {
  Cart();

  final List<CartItem> items = [];

  double get total => items.fold(
        0.0,
        (previousValue, item) => (item.qty * item.price) + previousValue,
      );

  int get noOfItems => items.length;

  void addItem(Item item) {
    /// Add only if the item no in the cart
    if (!items.map((e) => e.id).contains(item.id)) {
      items.add(
        CartItem.fromItem(item, 1),
      );
    }
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }
}

class CartProvider extends Cart with ChangeNotifier {
  @override
  void addItem(Item item) {
    super.addItem(item);
    notifyListeners();
  }

  @override
  void removeItem(CartItem item) {
    super.removeItem(item);
    notifyListeners();
  }
}

class CartItem extends Item {
  CartItem({
    this.qty = 1,
    required super.id,
    required super.name,
    required super.price,
  });

  factory CartItem.fromItem(Item item, int qty) {
    return CartItem(id: item.id, name: item.name, price: item.price, qty: qty);
  }

  // Quantity of the item.
  int qty;
}
