import 'package:bookly_clean_arch/Features/home/presentation/manager/NewsetBooks_cubit/newset_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_clean_arch/core/utils/functions/error_snackBar.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/bookly_entity.dart';
import '../../../../../core/widgets/book_list_view_loading.dart';

class BestSellerListViewBlocConsumer extends StatelessWidget {
  const BestSellerListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSucsses) {
          books.addAll(state.books);
        }
        if (state is NewsetBooksFailurePagination) {
          errorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewsetBooksSucsses ||
            state is NewsetBooksLoadingPagination ||
            state is NewsetBooksFailurePagination) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewsetBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: BookListViewLoading());
        }
      },
    );
  }
}
