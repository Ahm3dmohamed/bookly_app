import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/widgets/custom_bottomnavigation.dart';
import 'package:bookly/core/utils/widgets/custom_appbar.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_bestseller_books.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_books_lisview.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigation(),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.width(3)),
          child: const Column(
            children: [
              CustomAppbar(),
              FeatureBookSListView(),
              CustomBestSellerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
