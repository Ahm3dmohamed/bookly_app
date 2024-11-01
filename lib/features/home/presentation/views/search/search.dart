import 'package:bookly/features/home/presentation/views/search/widgets/custom_search_textfield.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: CustomSearchTextField(),
            )
          ],
        ),
      ),
    );
  }
}
