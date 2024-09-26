import 'package:bookly_clean_arch/Features/home/presentation/manager/featuredBook_cubit/featured_book_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/bookly_entity.dart';
import '../../../../../core/utils/functions/error_snackBar.dart';
import 'featuredBook_listView_loading.dart';

class FeaturedBookListViewBlocConsumer extends StatefulWidget {
  const FeaturedBookListViewBlocConsumer({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedBookListViewBlocConsumer> createState() =>
      _FeaturedBookListViewBlocConsumerState();
}

class _FeaturedBookListViewBlocConsumerState
    extends State<FeaturedBookListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBookPaginationFailure) {
          errorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBookPaginationLoading ||
            state is FeaturedBookPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBookFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const FeaturedBooksListViewLoading();
        }
      },
    );
  }
}
