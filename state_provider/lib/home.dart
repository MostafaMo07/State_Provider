import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/checkout.dart';
import 'package:state_provider/model/cart.dart';

import 'model/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [
    Item(name: "S20 Ultra", price: 12500),
    Item(name: "Note20 Ultra", price: 10000),
    Item(name: "Iphone 11", price: 13500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CheckOut();
                      }));
                    },
                    icon: Icon(Icons.add_shopping_cart)),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.count}");
                    },
                  ),
                )
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListTile(
                  title: Text("${items[i].name}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cart.add(items[i]);
                    },
                  ),
                );
              },
            ));
          },
        ));
  }
}
