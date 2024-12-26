import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';

class CartCubit extends Cubit<List<Item>> {
  CartCubit() : super([]) {
    _loadCart();
  }

  void addBookToCart(Item book) {
    final updatedCart = List<Item>.from(state)..add(book);
    emit(updatedCart);
    _saveCart(updatedCart);
  }

  void removeBookFromCart(Item book) {
    final updatedCart = List<Item>.from(state)..remove(book);
    emit(updatedCart);
    _saveCart(updatedCart);
  }

  Future<void> _saveCart(List<Item> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(cart.map((e) => e.toJson()).toList());
    await prefs.setString('cart', cartJson);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cart');
    if (cartJson != null) {
      final cartList = jsonDecode(cartJson) as List;
      final cart = cartList.map((e) => Item.fromJson(e)).toList();
      emit(cart);
    }
  }
}
