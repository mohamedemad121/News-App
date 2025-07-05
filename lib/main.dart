import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busines_logic/app_theme/app_theme_cubit.dart';
import 'package:newsapp/busines_logic/search_cubit/search_cubit.dart';
import 'package:newsapp/cache/cache_helper.dart';
import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/data/api_service/api_service.dart';
import 'package:newsapp/data/model/enum/theme_state.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit()..changeTheme(ThemeState.initial),
        ),
        BlocProvider(
          create:
              (context) =>
                  SearchCubit(HomeRepoImp(apiService: ApiService(dio: Dio()))),
        ),
      ],

      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is AppLightTheme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: ThemeData.light(),
            );
          } else if (state is AppDarkTheme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: ThemeData.dark(),
            );
          }
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
