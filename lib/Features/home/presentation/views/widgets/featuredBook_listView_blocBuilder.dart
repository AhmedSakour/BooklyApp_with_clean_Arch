import 'package:bookly_clean_arch/Features/home/presentation/manager/featuredBook_cubit/featured_book_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/entities/bookly_entity.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedBookListViewBlocBuilder> createState() =>
      _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState
    extends State<FeaturedBookListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBookPaginationLoading) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBookFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
