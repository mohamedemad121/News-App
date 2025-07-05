import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/busines_logic/global_cubit/global_cubit.dart';
import 'package:newsapp/components/list_view_card.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/data/api_service/api_service.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

class GlobalView extends StatelessWidget {
  const GlobalView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return BlocProvider(
      create:
          (context) =>
              GlobalCubit(HomeRepoImp(apiService: ApiService(dio: Dio())))
                ..repoGlobal(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Global News',
              style: TextStyle(
                fontSize: 22,
                color: isdark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                if (state is GlobalCubitLoading) {
                  return BrogressIndicatorLoaded();
                } else if (state is GlobalCubitSucces) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.globallist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              AppRouter.knewdeatils,
                              extra: state.globallist[index],
                            );
                          },
                          child: ListViewCard(
                            articles: state.globallist[index],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is GlobalCubitFailure) {
                  return Center(
                    child: Text(
                      'خطأ: ${state.err}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 400,
                    child: Center(
                      child: Text(
                        'حدث شيء غير متوقع',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
