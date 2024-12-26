import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/widgets/custom_listview.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:bookly/core/utils/widgets/custom_search_textfield.dart';
import 'package:bookly/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../api_service.dart';
import '../../../data/models/book_model/item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List<Item> searchResults = [];
  final Dio _dio = Dio();

  void _performSearch(String query) async {
    setState(() {
      isLoading = true;
    });

    final response = await HomeRepoImpl(ApiService(_dio)).performSearch(
      query: query,
    );

    response.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search failed: ${failure.toString()}')),
        );
        setState(() {
          isLoading = false;
        });
      },
      (bookModel) {
        setState(() {
          searchResults = bookModel.items ?? []; // Update with fetched items
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Item item = const Item();
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.height(2)),
              child: CustomSearchTextField(
                searchController: searchController,
                onSearch: _performSearch,
              ),
            ),
            if (isLoading)
              Expanded(child: const CustomLoadingIndicatorWidget())
            else
              Expanded(
                child: CustomListview(
                  books: searchResults,
                  items: item,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// class CustomListview extends StatelessWidget {
//   final List<Item> books;

//   const CustomListview({Key? key, required this.books}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: books.length,
//       itemBuilder: (context, index) {
//         final book = books[index];
//         return ListTile(
//           title: Text(book.volumeInfo?.title ?? 'No Title'),
//           subtitle: Text(book.volumeInfo?.authors?.join(', ') ?? 'No Author'),
//         );
//       },
//     );
//   }
// }
