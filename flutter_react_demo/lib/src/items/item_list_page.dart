import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  final items = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
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
            ),
          ),
        ),
      ),
    );
  }
}
