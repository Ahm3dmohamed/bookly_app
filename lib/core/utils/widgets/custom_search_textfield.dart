import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
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
