import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border_sharp),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(800000)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.teamsystem.com/magazine/contrib/uploads/Foodcost.jpg',
                          ))),
                ),
              ),
              SizedBox(height: 30),
              Badge(
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
              ),
              SizedBox(height: 8),
              Text('Lorem ipsum',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(height: 18),
              Text('Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(fontSize: 14, color: Colors.black45)),
              SizedBox(height: 18),
              Row(
                children: [
                  Text('€',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(width: 2),
                  Text('10',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  ElevatedButton(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
