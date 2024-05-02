import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Text('Lorem ipsum',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.black45)),
      leading: CircleAvatar(backgroundImage: NetworkImage('https://www.teamsystem.com/magazine/contrib/uploads/Foodcost.jpg',)),
      trailing: Text(
        '€10',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      hoverColor: Colors.orangeAccent.withOpacity(0.2),
      onTap: () {},
    );
  }
}
