import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/presentation/manager/similerBooks_cubit/similer_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  int pageNumber = 1;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    var currerntPostion = _scrollController.position.pixels;
    var maxPostion = _scrollController.position.maxScrollExtent;
    if (currerntPostion >= 0.7 * maxPostion) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilerBooksCubit>(context)
            .fetchSimilerBooks(pageNumber: pageNumber++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomBookImage(bookEntity: widget.books[index]),
            );
          }),
    );
  }
}
