import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../utils/app_router.dart';

class BookListViewItemLoading extends StatelessWidget {
  const BookListViewItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomFadingAnimation(
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: CustomFadingAnimation(
                    child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(16)),
            ))),
          ],
        ),
      ),
    );
  }
}
