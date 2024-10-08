import 'package:bookly_clean_arch/Features/home/data/data%20_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/Features/home/data/data%20_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_clean_arch/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>())));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
      searchRemoteDataSourceImpl:
          SearchRemoteDataSourceImpl(getIt.get<ApiService>())));
}
