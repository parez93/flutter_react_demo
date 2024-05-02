import 'package:flutter/material.dart';

class ItemBody extends StatelessWidget {
  const ItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Lorem ipsum',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(height: 18),
        Text('Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 14, color: Colors.black45)),
      ],
    );
  }
}