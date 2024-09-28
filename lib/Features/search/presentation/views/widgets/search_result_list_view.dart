import 'package:bookly_clean_arch/Features/search/presentation/manager/Search_Input_cubit/search_input_cubit.dart';
import 'package:bookly_clean_arch/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_clean_arch/Features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  late final ScrollController scrollController;
  bool isLoading = false;
  int pageNumber = 1;
  late String searchInput;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    searchInput = BlocProvider.of<SearchInputCubit>(context).searchInput;

    super.initState();
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;

        await BlocProvider.of<SearchCubit>(context).fetchSearchResult(
            searchInput: searchInput, pageNumber: pageNumber++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .75,
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SearchBookListViewItem(
                book: widget.books[index],
              ));
        },
      ),
    );
  }
}
