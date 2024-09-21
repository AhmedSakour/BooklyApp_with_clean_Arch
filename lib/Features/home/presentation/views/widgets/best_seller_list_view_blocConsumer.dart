import 'package:bookly_clean_arch/Features/home/presentation/manager/NewsetBooks_cubit/newset_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/views/widgets/best_seller_list_view.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocConsumer extends StatelessWidget {
  const BestSellerListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsetBooksSucsses) {
          return BestSellerListView(
            books: state.books,
          );
        } else if (state is NewsetBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
