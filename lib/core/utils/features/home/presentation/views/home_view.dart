import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:flutter/material.dart';
import '../../../../style.dart';
import '../../../../widgets/custom_appbar.dart';
import 'widgets/bestseller_book_lstview.dart';
import 'widgets/feature_books_lisview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.width(3)),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppbar(),
                    SizedBox(
                      height: SizeConfig.height(25),
                      child: const FeatureBookSListView(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 2),
                      child: Row(
                        children: [
                          Text("Best Seller Book ", style: Styles.textStyle18),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height(64), // Define height explicitly
                      child: const BestSellerBookListview(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
