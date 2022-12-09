import 'package:devfest_2022_flutter/data/items.dart';

class Cart {
  Cart();

  factory Cart.withValues(List<Item> items) {
    final cart = Cart();
    for (Item item in items) {
      cart.addItem(item);
    }
    return cart;
  }

  final List<CartItem> items = [];

  double get total => items.fold(
        0.0,
        (previousValue, item) => (item.qty * item.price) + previousValue,
      );

  int get noOfItems => items.length;

  void addItem(Item item) {
    items.add(
      CartItem.fromItem(item, 1),
    );
  }

  void removeItem(CartItem item) {
    items.remove(item);
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
