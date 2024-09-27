import 'package:bookly_clean_arch/Features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SearchBookListViewItem(
              book: books[index],
            ));
      },
    );
  }
}
