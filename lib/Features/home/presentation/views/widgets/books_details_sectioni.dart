import 'package:flutter/material.dart';

import '../../../../../core/entities/bookly_entity.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(bookEntity: bookEntity),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookEntity.title,
          style: Styles.textStyle30
              .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookEntity.author,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          rating: '${bookEntity.rating ?? 3.5}',
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(url: '${bookEntity.bookUrl}', price: '${bookEntity.price}'),
      ],
    );
  }
}
