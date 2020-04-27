import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanillashoppingcart/main.dart';

class MyCart extends StatefulWidget{
  Function toggle;
  Function resetAll;
  String title;
  List<Item> items;

  MyCart(this.toggle, this.resetAll, this.items, {Key key, this.title="MyCart"}): super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}


class _MyCartState extends State<MyCart> {

  String totalPrice(){
    num total = 0;
    for(var item in widget.items){
      total+=item.price;
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: widget.toggle,
        ),
        backgroundColor: Colors.teal,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for(var item in widget.items) Text(item.name)
              ],
            ),
            Row(
              children: <Widget>[
                Text("The Total Price is : \$"),
                Text(totalPrice())
              ],
            ),
            RaisedButton(
              onPressed: widget.resetAll,
              child: Text("Reset All"),
            )
          ],
        ),
      )
    );
  }
}