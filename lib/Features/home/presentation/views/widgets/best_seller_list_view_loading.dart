import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/best_seller%20_list_view_item_loading.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoading extends StatelessWidget {
  const BestSellerListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
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
