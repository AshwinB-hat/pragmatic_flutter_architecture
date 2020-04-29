import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodelshoppingcart/Item.dart';
import 'StateContainer.dart';

class MyCatalog extends StatefulWidget {
  final String title;

  @override
  State createState() {
    return _MyCatalogState();
  }

  MyCatalog({Key key, this.title = "Catalog"}) : super(key: key);
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> availableItems = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text(widget.title)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ScopedModel.of<StateContainer>(context).toggle,
          ),
        ],
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.teal,
                thickness: 5,
                height: 1,
              ),
          itemCount: availableItems.length,
          itemBuilder: (context, index) {
            final it = availableItems[index];

            return Container(
              color: ScopedModel.of<StateContainer>(context).isSelected(it)? Colors.blueGrey : null,
              child: ListTile(
                title: Text(it.name,
                  style: TextStyle(
                    color: ScopedModel.of<StateContainer>(context).isSelected(it)? Colors.white : null
                  ) ,
                ),
                trailing: Text("\$" + it.price.toString(),
                  style: TextStyle(
                    color: ScopedModel.of<StateContainer>(context).isSelected(it)? Colors.white : null
                )
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: () {
                  StateContainer scs = ScopedModel.of<StateContainer>(context);
                  if (!scs.isSelected(it)) {
                    scs.addItem(it);
                  } else {
                    scs.removeItem(it);
                  }
                },
              ),
            );
          }),
    );
  }
}
