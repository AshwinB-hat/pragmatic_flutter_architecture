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
