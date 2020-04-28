import 'package:flutter/cupertino.dart';
import 'package:inheritedwidgetshpppingcart/Item.dart';

class MyInheritedWidget extends InheritedWidget{
  final StateContainerState data;

  MyInheritedWidget({ Key key, @required Widget child, @required this.data}):super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class StateContainer extends StatefulWidget{
  final Widget child;

  StateContainer({Key key, @required this.child}): super(key:key);

  static StateContainerState of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>().data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  List<Item> _items = [];
  bool state;

  @override
  void initState() {
    super.initState();
    state=true;
    _items = [];
  }

  void toggle() {
    setState(() {
      state = !state;
    });
  }

  List<Item> getItems(){
    return _items;
  }

  void addItem(Item value) {
    setState(() {
      _items.add(value);
    });
  }

  void removeItem(Item value) {
    setState(() {
      _items.remove(value);
    });
    print(_items);
  }

  bool isSelected(Item value) {
    return _items.contains(value);
  }

  void resetAll() {
    setState(() {
      _items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}