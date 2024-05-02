import 'package:flutter/material.dart';

class ItemRating extends StatelessWidget {
  const ItemRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: Colors.grey[200],
      textColor: Colors.black,
      largeSize: 20,
      label: Row(
        children: [
          SizedBox(width: 2),
          Icon(Icons.star, color: Colors.yellow.shade700, size: 14),
          SizedBox(width: 4),
          Text('4,8'),
          SizedBox(width: 2),
        ],
      ),
    );
  }
}
