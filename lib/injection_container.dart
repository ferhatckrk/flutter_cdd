import 'package:dio/dio.dart';
import 'package:flutter_tdd_news/features/daily_news/data/remote/news_api_service.dart';
import 'package:flutter_tdd_news/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_tdd_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_tdd_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_tdd_news/features/daily_news/presentation/bloc/article/bloc/remote_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  getIt.registerSingleton<Dio>(Dio());

  // Dependencies
  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(getIt()));

  //UseCase
  getIt.registerSingleton<GetArticleUseCase>(GetArticleUseCase(getIt()));

  //Blocs
  getIt.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(getIt()));
}
