import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/presentation/manager/featuredBook_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../book_details_view.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int pageNumber = 1;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBookCubit>(context)
            .fetchFeaturedBooks(pageNumber: pageNumber++);
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
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: widget.books.length,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BookDetailsView(bookEntity: widget.books[index]);
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(bookEntity: widget.books[index]),
              ),
            );
          }),
    );
  }
}
