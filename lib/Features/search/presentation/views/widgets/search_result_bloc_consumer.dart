import 'package:bookly_clean_arch/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_clean_arch/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/book_list_view_loading.dart';

class SearchResultBlocConsumer extends StatelessWidget {
  const SearchResultBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchResultListView(
            books: state.books,
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
