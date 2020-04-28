import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inheritedwidgetshpppingcart/StateContainer.dart';
import 'package:inheritedwidgetshpppingcart/main.dart';

class MyCart extends StatefulWidget{
  String title;

  MyCart({Key key, this.title="MyCart"}): super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}


class _MyCartState extends State<MyCart> {

  String totalPrice(){
    num total = 0;
    for(var item in StateContainer.of(context).getItems()){
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
          onPressed: StateContainer.of(context).toggle,
        ),
        backgroundColor: Colors.teal,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                for(var item in StateContainer.of(context).getItems()) Text(item.name)
              ],
            ),
            Row(
              children: <Widget>[
                Text("The Total Price is : \$"),
                Text(totalPrice())
              ],
            ),
            RaisedButton(
              onPressed: StateContainer.of(context).resetAll,
              child: Text("Reset All"),
            )
          ],
        ),
      )
    );
  }
}