import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
    required this.onSearch,
    required TextEditingController searchController,
  });

  TextEditingController searchController = TextEditingController();

  final Function(String query) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: onSearch,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          hintText: "Search for  books....!!",
          labelText: "Search for  books....!!",
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ))),
    );
  }
}
