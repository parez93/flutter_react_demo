import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Add to cart'),
      style: ButtonStyle(
          shape:
          MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          fixedSize: MaterialStateProperty.resolveWith(
                  (states) => Size(200, 40)),
          backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.black),
          foregroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.white)),
    );
  }
}
