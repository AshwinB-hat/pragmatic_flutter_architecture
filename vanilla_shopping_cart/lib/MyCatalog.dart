import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanillashoppingcart/main.dart';

class MyCatalog extends StatefulWidget {
  Function addItem;
  Function removeItem;
  Function isSelected;
  Function toggle;

  final String title;

  @override
  State createState() {
    return _MyCatalogState();
  }

  MyCatalog(this.addItem, this.removeItem, this.isSelected, this.toggle,
      {Key key, this.title = "Catalog"})
      : super(key: key);
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> availableItems = [
    Item("chocolate", 10),
    Item("Mars", 20),
    Item("Galaxy", 30),
    Item("Twix", 40),
    Item("Bounty", 20),
    Item("Lindth", 20),
    Item("M&M", 20),
    Item("Munch", 20),
    Item("Kit Kat", 25),
    Item("Firestik", 20),
    Item("Malteser", 20),
  ];
//
//  @override
//  void initState() {
//    availableItems =
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(child: Text(widget.title)),
          actions: <Widget>[
            IconButton(
                icon:Icon(Icons.shopping_cart),
              onPressed: widget.toggle,
            ),
          ],
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.black),
            itemCount: availableItems.length,
            itemBuilder: (context, index) {
              final it = availableItems[index];

              return ListTile(
                title: Text(it.name),
                trailing: Text("\$" + it.price.toString()),
                contentPadding: EdgeInsets.all(10),
                onTap: () {
                  if (!widget.isSelected(it)) {
                    widget.addItem(it);
                  } else {
                    widget.removeItem(it);
                  }
                },
                selected: widget.isSelected(it),
              );
            }),
    );
  }
}
