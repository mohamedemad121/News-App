import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/busines_logic/carousel_cubit/carousel_cubit.dart';
import 'package:newsapp/busines_logic/list_cubit/list_cubit.dart';
import 'package:newsapp/components/list_view_card.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/views/home_view.dart/widgets/carousel_slider.dart';
import 'package:newsapp/views/home_view.dart/widgets/recommondation_.dart';
import 'package:newsapp/views/home_view.dart/widgets/row_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CarouselCubit>().repoCarusel();
    context.read<ListCubitCubit>().repoList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RowText(),
            ),
            SizedBox(height: 20),
            BlocBuilder<CarouselCubit, CarouselState>(
              builder: (context, state) {
                if (state is CarouselCubitLoading) {
                  return BrogressIndicatorLoaded();
                } else if (state is CarouselCubitSucces) {
                  return MyCarouselSlider(articles: state.articles);
                } else if (state is CarouselCubitFailure) {
                  return Center(
                    child: Text(
                      'خطأ: ${state.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return Text('errorrrr');
                }
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RecommendationText(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<ListCubitCubit, ListCubitState>(
                builder: (context, state) {
                  if (state is ListCubitLoading) {
                    return BrogressIndicatorLoaded();
                  } else if (state is ListCubitSucces) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(
                                AppRouter.knewdeatils,
                                extra: state.articles[index],
                              );
                            },
                            child: ListViewCard(
                              articles: state.articles[index],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is ListCubitFailure) {
                    return Center(
                      child: Text(
                        'خطأ: ${state.error}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return Text('errorrrr');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
