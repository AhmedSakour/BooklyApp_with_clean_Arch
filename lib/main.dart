import 'package:bookly_clean_arch/Features/home/Domain/use_case/fetch_newset_books_use_case.dart';
import 'package:bookly_clean_arch/Features/home/Domain/use_case/similer_books_use_case.dart';
import 'package:bookly_clean_arch/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/Features/home/presentation/manager/NewsetBooks_cubit/newset_books_cubit.dart';
import 'package:bookly_clean_arch/Features/home/presentation/manager/similerBooks_cubit/similer_books_cubit.dart';
import 'package:bookly_clean_arch/Features/search/presentation/manager/Search_Input_cubit/search_input_cubit.dart';
import 'package:bookly_clean_arch/core/utils/bloc_observer.dart';
import 'package:bookly_clean_arch/core/utils/functions/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/Domain/use_case/fetch_featuredBook_use_case.dart';
import 'Features/home/presentation/manager/featuredBook_cubit/featured_book_cubit.dart';
import 'constants.dart';
import 'core/entities/bookly_entity.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewSetBox);
  await Hive.openBox<BookEntity>(kSimilerBox);

  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
              FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
            create: (context) => NewsetBooksCubit(
                FetchNewsetBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
              ..fetchNewsetBooks()),
        BlocProvider(
          create: (context) => SimilerBooksCubit(
              FetchSimilerBookUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
            ..fetchSimilerBooks(),
        ),
        BlocProvider(
          create: (context) => SearchInputCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
