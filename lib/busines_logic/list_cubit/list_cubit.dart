import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

part 'list_state.dart';

class ListCubitCubit extends Cubit<ListCubitState> {
  final HomeRepoImp homeRepoImp;
  ListCubitCubit(this.homeRepoImp) : super(ListCubitInitial());
  Future<void> repoList() async {
    try {
      emit(ListCubitLoading());
      final data = await homeRepoImp.repoList();
      emit(ListCubitSucces(articles: data));
    } catch (e) {
      emit(ListCubitFailure(error: e.toString()));
    }
  }
}
