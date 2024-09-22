import 'package:bookly_clean_arch/Features/home/presentation/manager/similerBooks_cubit/similer_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featuredBook_listView_loading.dart';

class SimilerBooksListViewBlocConsumner extends StatelessWidget {
  const SimilerBooksListViewBlocConsumner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilerBooksCubit, SimilerBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SimilerBooksSuccess) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is SimilerBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedBooksListViewLoading();
        }
      },
    );
  }
}
