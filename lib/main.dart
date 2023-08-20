import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_news/config/theme/app_themes.dart';
import 'package:flutter_tdd_news/features/daily_news/presentation/bloc/article/bloc/remote_bloc.dart';
import 'package:flutter_tdd_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticlesBloc>(
          create: (_) => getIt()..add(const GetArticles()),
        ),
      ],
      child: MaterialApp(
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
