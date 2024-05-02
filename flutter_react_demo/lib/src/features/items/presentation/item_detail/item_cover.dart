import 'package:flutter/material.dart';

class ItemCover extends StatelessWidget {
  const ItemCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(800000)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://www.teamsystem.com/magazine/contrib/uploads/Foodcost.jpg',
              ))),
    );
  }
}