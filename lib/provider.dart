import 'package:flutter/cupertino.dart';
import 'package:task_add_to_cart/data_model/item_list.dart';

class CartProvider extends ChangeNotifier{
  List<ItemDM> cartItems =[];
  double total_price = 0;
int get itemCount => cartItems.length;

void addItem(ItemDM item){

  cartItems.add(item);
  total_price+=item.price;
  item.quntity++;
  notifyListeners();

}
  void removeItem(ItemDM item){

    cartItems.remove(item);
    total_price-=item.price;
    item.quntity--;
    notifyListeners();

  }
  double get totalPrice{
  return total_price;
  }
}