import 'package:flutter/material.dart';
import 'package:vanillashoppingcart/MyCatalog.dart';
import 'MyCart.dart';
import 'package:quiver/core.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shopping Cart (Stateful Widgets)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Item> _items = [];
  bool state = true;

  void _toggle(){
    setState(() {
    state = !state;
    });
  }

  void _addItem(Item value){
    setState(() {
      _items.add(value);
    });
    print(_items);
  }

  void _removeItem(Item value){
    setState(() {
      _items.remove(value);
    });
    print(_items);
  }

  bool _isSelected(Item value){
    return _items.contains(value);
  }

  void _resetAll(){
    setState(() {
      _items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return state? MyCatalog( _addItem, _removeItem,_isSelected, _toggle): MyCart(_toggle, _resetAll, _items);
  }


}

class Item{
  String name;
  num price;

  @override
  String toString() {
    return name;
  }


  @override
  bool operator ==(other) {
    return other is Item && other.name==name;
  }


  @override
  int get hashCode {
    return name.hashCode;
  }

  Item(this.name, this.price);
}
