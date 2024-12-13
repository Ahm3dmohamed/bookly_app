import 'package:bookly/core/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/style.dart';
import '../../../../core/utils/widgets/custom_appbar.dart';
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
                      height: SizeConfig.height(27),
                      child: const FeatureBookSListView(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 4),
                      child: Row(
                        children: [
                          Text("NewestBooks ", style: Styles.textStyle20),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.height(50), // Define height explicitly
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
