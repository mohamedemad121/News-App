import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/busines_logic/search_cubit/search_cubit.dart';
import 'package:newsapp/components/list_view_card.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/core/constant/colors.dart';
import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/views/search_view.dart/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int currentindex = 0;
  final List<String> category = [
    'sports',

    'health',
    'technology',
    'business',
    'education',
    'environment',
    'science',
    'travel',
    'entertainment',
  ];
  @override
  void initState() {
    context.read<SearchCubit>().funcSearch(endPoint: 'sports');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontSize: 36,
              color: isdark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              'News from all around world',
              style: TextStyle(color: isdark ? Colors.white : Colors.black),
            ),
          ),
          SizedBox(height: 15),
          SearchTextField(),
          SizedBox(height: 15),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (currentindex != index) {
                        setState(() {
                          currentindex = index;
                          context.read<SearchCubit>().funcSearch(
                            endPoint: category[index],
                          );
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            currentindex == index
                                ? (isdark ? Colors.orange : Colors.blue)
                                : (isdark
                                    ? Colors.white
                                    : ColorsManager.kcolortextfiled),
                      ),

                      child: Center(
                        child: Opacity(
                          opacity: 1,
                          child: Text(
                            category[index],
                            style: TextStyle(
                              color:
                                  currentindex == index
                                      ? Colors.white
                                      : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return BrogressIndicatorLoaded();
                } else if (state is SearchSuccses) {
                  return ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            AppRouter.knewdeatils,
                            extra: state.news[index],
                          );
                        },
                        child: ListViewCard(articles: state.news[index]),
                      );
                    },
                  );
                } else if (state is SearchFailure) {
                  return Center(
                    child: Text(
                      'خطأ: ${state.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return Text('خطا');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
