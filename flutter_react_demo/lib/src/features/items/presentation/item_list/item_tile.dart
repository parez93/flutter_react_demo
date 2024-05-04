import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({required this.item, required this.onTap});

  final Item item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Text(item.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(item.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.black45)),
      leading: CircleAvatar(backgroundImage: NetworkImage(item.imageUrl,)),
      trailing: Text(
        '€${item.price}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      hoverColor: Colors.orangeAccent.withOpacity(0.2),
      onTap: onTap,
    );
  }
}
