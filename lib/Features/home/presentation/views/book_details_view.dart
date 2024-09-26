import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/bookly_entity.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookEntity: bookEntity),
      ),
    );
  }
}
