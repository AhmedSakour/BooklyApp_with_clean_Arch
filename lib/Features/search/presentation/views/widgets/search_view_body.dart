import 'package:bookly_clean_arch/Features/search/presentation/views/widgets/search_result_bloc_consumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/service_locator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../Domain/use_case/fetch_search_result_use_case.dart';
import '../../../data/repo/search_repo_impl.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
          FethcSearchResultUseCase(searchRepo: getIt.get<SearchRepoImpl>())),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Search Result',
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 36,
              ),
              const SearchResultBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
