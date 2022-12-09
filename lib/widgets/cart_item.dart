import 'package:devfest_2022_flutter/data/cart.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.item,
    this.onDelete,
  });

  final CartItem item;

  final ValueChanged<CartItem>? onDelete;

  void _onDismissed(DismissDirection direction) => onDelete!(item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: onDelete != null ? _onDismissed : null,
      child: Card(
        child: ListTile(
          title: Text(item.name),
          subtitle: Text('${item.qty} * ${item.price}'),
        ),
      ),
    );
  }
}
