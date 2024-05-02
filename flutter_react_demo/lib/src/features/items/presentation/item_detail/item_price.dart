import 'package:flutter/material.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('€',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        SizedBox(width: 2),
        Text('10',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    );
  }
}