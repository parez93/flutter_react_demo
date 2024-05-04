import 'package:flutter/material.dart';

class ItemBody extends StatelessWidget {
  const ItemBody({
    required this.title,
    required this.description
  });

  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(height: 18),
        Text('Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(description,
            style: TextStyle(fontSize: 14, color: Colors.black45)),
      ],
    );
  }
}