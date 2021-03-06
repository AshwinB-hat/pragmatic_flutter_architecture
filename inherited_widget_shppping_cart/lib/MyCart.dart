import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inheritedwidgetshpppingcart/StateContainer.dart';
import 'package:inheritedwidgetshpppingcart/main.dart';

class MyCart extends StatefulWidget {
  String title;

  MyCart({Key key, this.title = "MyCart"}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  String totalPrice() {
    num total = 0;
    for (var item in StateContainer.of(context).getItems()) {
      total += item.price;
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
              SizedBox(
                height: 400,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for(var item in StateContainer.of(context).getItems()) Row(
                            children: <Widget>[
                              Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 30,
                                  ),
                              )],)
                        ],
                      ),
                    ],
                  )
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("The Total Price is : ", style: TextStyle(fontSize: 20,)),
                  Text("\$"+totalPrice(),style: TextStyle(color: Colors.teal, fontSize: 40),)
                ],
              ),
              Spacer(),
              RaisedButton(
                onPressed: StateContainer.of(context).resetAll,
                color: Colors.teal,
                child: Text(
                  "Reset All",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
