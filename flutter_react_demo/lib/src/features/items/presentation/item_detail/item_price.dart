import 'package:flutter/material.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    required this.price,
  });

  final double price;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('€',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        SizedBox(width: 2),
        Text('$price',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    );
  }
}