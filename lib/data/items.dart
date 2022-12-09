/// Class to represent Item.
class Item {
  const Item({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;

  final String name;

  final double price;
}

/// Fake list of items to use in Home page.
const listOfAvailableItems = [
  Item(id: '001', name: 'Unisex T shirt', price: 10.0),
  Item(id: '002', name: 'Flutter Socks', price: 20.0),
  Item(id: '003', name: 'Flutter Cap', price: 30.0),
];
