import 'package:ecommerce/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier{

  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async{
    _cart = db.getCartList();
    return _cart;
  }
  void _setPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setInt('total_price', _totalPrice as int);
    notifyListeners();
  }

  void _getPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item')?? 0;
    _totalPrice = prefs.getDouble('total_price')?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(double price){
    _totalPrice = _totalPrice +price;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double price){
    _totalPrice = _totalPrice -price;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice(){
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter (){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter(){
    _getPrefItems();
    return _counter;
  }
}