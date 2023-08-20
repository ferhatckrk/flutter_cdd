import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_tdd_news/core/constants/constants.dart';
import 'package:flutter_tdd_news/features/daily_news/data/models/article.dart';
import 'package:flutter_tdd_news/core/resources/data_state.dart';
import 'package:flutter_tdd_news/features/daily_news/data/remote/news_api_service.dart';
import 'package:flutter_tdd_news/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpReponse = await _newsApiService.getNewsArticle(
        apiKey: newsAPIKey,
        category: categoryQuery,
        qountry: countryQuery,
      );

      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpReponse.response.statusMessage,
            response: httpReponse.response,
            requestOptions: httpReponse.response.requestOptions,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
