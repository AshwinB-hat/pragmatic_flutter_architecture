import 'package:scoped_model/scoped_model.dart';
import 'Item.dart';


class StateContainer extends Model {
  List<Item> _items = [];
  bool state=true;


  void toggle() {
    state = !state;
    notifyListeners();
  }

  List<Item> getItems(){
    return _items;
  }

  void addItem(Item value) {
    _items.add(value);
    notifyListeners();
  }

  void removeItem(Item value) {
      _items.remove(value);
      notifyListeners();
  }

  bool isSelected(Item value) {
    return _items.contains(value);
  }

  void resetAll() {
      _items.clear();
      notifyListeners();
  }
}