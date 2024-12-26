import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/utils/widgets/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Shopping Cart',
          style: Styles.textStyle18,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, List<Item>>(
        builder: (context, cartItems) {
          final items = Item();
          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty!'),
            );
          }
          return CustomListview(books: cartItems, items: items);
        },
      ),
    );
  }
}
