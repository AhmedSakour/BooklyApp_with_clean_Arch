import 'package:bookly_clean_arch/Features/home/presentation/manager/similerBooks_cubit/similer_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similerBooks_listView_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/error_snackBar.dart';
import '../../../Domain/entities/bookly_entity.dart';

class SimilerBooksListViewBlocConsumner extends StatelessWidget {
  const SimilerBooksListViewBlocConsumner({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<SimilerBooksCubit, SimilerBooksState>(
      listener: (context, state) {
        if (state is SimilerBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SimilerBooksPaginationFailure) {
          errorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is SimilerBooksSuccess ||
            state is SimilerBooksPaginationLoading ||
            state is SimilerBooksPaginationFailure) {
          return SimilarBooksListview(
            books: books,
          );
        } else if (state is SimilerBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SimilerBooksListViewLoading();
        }
      },
    );
  }
}
