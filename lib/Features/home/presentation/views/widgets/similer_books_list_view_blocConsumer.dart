import 'package:bookly_clean_arch/Features/home/presentation/manager/similerBooks_cubit/similer_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similerBooks_listView_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/bookly_entity.dart';
import '../../../../../core/utils/functions/error_snackBar.dart';

class SimilerBooksListViewBlocConsumner extends StatefulWidget {
  const SimilerBooksListViewBlocConsumner({super.key});

  @override
  State<SimilerBooksListViewBlocConsumner> createState() =>
      _SimilerBooksListViewBlocConsumnerState();
}

class _SimilerBooksListViewBlocConsumnerState
    extends State<SimilerBooksListViewBlocConsumner> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
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
            books: state is SimilerBooksSuccess ? state.books : books,
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
