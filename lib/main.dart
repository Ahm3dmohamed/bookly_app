import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/featured_books_%20cubit/features_books_cubit.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/core/utils/features/home/presentation/views/splash/splash_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturesBooksCubit(getIt.get<HomeRepoImpl>())..fetchFutureBook(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              SimillerBookCubit(getIt.get<HomeRepoImpl>())..fetchSimillerBook(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home: const SplashView(),
      ),
    );
  }
}
