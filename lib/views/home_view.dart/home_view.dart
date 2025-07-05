import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busines_logic/carousel_cubit/carousel_cubit.dart';
import 'package:newsapp/busines_logic/list_cubit/list_cubit.dart';
import 'package:newsapp/data/api_service/api_service.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';
import 'package:newsapp/views/home_view.dart/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => CarouselCubit(
                HomeRepoImp(apiService: ApiService(dio: Dio())),
              ),
        ),
        BlocProvider(
          create:
              (context) => ListCubitCubit(
                HomeRepoImp(apiService: ApiService(dio: Dio())),
              ),
        ),
      ],
      child: HomeViewBody(),
    );
  }
}
