import 'package:bloc/bloc.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Articles>allNews =[];
  final HomeRepoImp homeRepoImp;
  SearchCubit(this.homeRepoImp) : super(SearchInitial());
  Future<void> funcSearch({required String endPoint}) async {
    try {
      emit(SearchLoading());
      final data = await homeRepoImp.repoSearch(endPoint: endPoint);
      allNews =data;
      emit(SearchSuccses(news: allNews));
    } catch (e) {
      emit(SearchFailure(error: e.toString()));
    }
  }
       
  void filterByFirstLetter(String letter) {
    if (letter.trim().isEmpty) {
      emit(SearchSuccses(news: allNews));
    } else {
      final filtered = allNews.where((newsItem) {
        final title = newsItem.title!.trim().toLowerCase();
        return title.startsWith(letter.toLowerCase());
      }).toList();
      emit(SearchSuccses(news: filtered));
    }
  }
}

