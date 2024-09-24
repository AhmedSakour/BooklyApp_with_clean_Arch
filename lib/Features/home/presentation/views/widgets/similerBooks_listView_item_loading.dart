import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';

class SimilerBooksListViewItemLaoding extends StatelessWidget {
  const SimilerBooksListViewItemLaoding({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
