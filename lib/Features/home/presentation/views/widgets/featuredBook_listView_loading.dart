import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'custom_bookItem_loading.dart';

class FeaturedBooksListViewLoading extends StatelessWidget {
  const FeaturedBooksListViewLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImageLoading(),
              );
            }),
      ),
    );
  }
}
