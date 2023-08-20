import 'package:flutter_tdd_news/core/resources/data_state.dart';
import 'package:flutter_tdd_news/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
