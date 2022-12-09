import 'package:devfest_2022_flutter/data/items.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    this.onAddItem,
  });

  /// The item to be rendered.
  final Item item;

  /// Action to be called when add item button is pressed.
  final ValueChanged<Item>? onAddItem;

  void _onPressed() {
    onAddItem?.call(item);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.price.toString()),
      trailing: IconButton(
        icon: const Icon(Icons.add_circle),
        onPressed: _onPressed,
      ),
    );
  }
}
