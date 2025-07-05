import 'package:go_router/go_router.dart';
import 'package:newsapp/components/deatils_news/deatails_global.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/splashview/splashview.dart';
import 'package:newsapp/views/global_view.dart/global_view.dart';
import 'package:newsapp/views/gnav/gnav.dart';
import 'package:newsapp/views/home_view.dart/home_view.dart';
import 'package:newsapp/views/search_view.dart/search_view.dart';

abstract class AppRouter {
  static const khomeView = '/homeview';
  static const kGnav = '/gnav';
  static const knewdeatils = '/knewdeatils';
  static const ksearchview = '/ksearchview';
  static const kglobal = '/kglobal';
  static const kdeatilsglobal = '/kdeatilsgobal';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => Splashview()),
      GoRoute(path: kGnav, builder: (context, state) => Gnav()),

      GoRoute(path: khomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: knewdeatils,
        builder: (context, state) {
          final article = state.extra as Articles;
          return DeatilsNews(articles: article);
        },
      ),
      GoRoute(path: ksearchview, builder: (context, state) => SearchView()),
      GoRoute(path: kglobal, builder: (context, state) => GlobalView()),
      GoRoute(
        path: kdeatilsglobal,
        builder: (context, state) {
          final article = state.extra as Articles;
          return DeatilsNews(articles: article);
        },
      ),
    ],
  );
}
