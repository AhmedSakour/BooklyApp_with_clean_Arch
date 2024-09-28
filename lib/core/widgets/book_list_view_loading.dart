import 'package:bookly_clean_arch/core/widgets/book%20_list_view_item_loading.dart';
import 'package:flutter/material.dart';

class BookListViewLoading extends StatelessWidget {
  const BookListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItemLoading(),
        );
      },
    );
  }
}
