import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tdd_news/core/constants/constants.dart';
import 'package:flutter_tdd_news/features/daily_news/data/models/article.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query('apiKey') String? apiKey,
    @Query('country') String? qountry,
    @Query('category') String? category,
  });
}
