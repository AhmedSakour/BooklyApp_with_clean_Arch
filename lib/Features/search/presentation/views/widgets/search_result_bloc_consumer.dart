import 'package:bookly_clean_arch/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_clean_arch/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/error_snackBar.dart';
import '../../../../../core/widgets/book_list_view_loading.dart';

class SearchResultBlocConsumer extends StatefulWidget {
  const SearchResultBlocConsumer({super.key});

  @override
  State<SearchResultBlocConsumer> createState() =>
      _SearchResultBlocConsumerState();
}

class _SearchResultBlocConsumerState extends State<SearchResultBlocConsumer> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          books.addAll(state.books);
        }
        if (state is SearchFailurePagination) {
          errorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess ||
            state is SearchLoadingPagination ||
            state is SearchFailurePagination) {
          return SearchResultListView(
            books: state is SearchSuccess ? state.books : books,
          );
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is SearchLoading) {
          return const Center(child: BookListViewLoading());
        } else {
          return Container();
        }
      },
    );
  }
}
