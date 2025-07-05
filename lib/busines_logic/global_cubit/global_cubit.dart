import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  final HomeRepoImp homeRepoImp;
  GlobalCubit(this.homeRepoImp) : super(GlobalCubitInitial());
  Future<void> repoGlobal() async {
    try {
      emit(GlobalCubitLoading());
      final data = await homeRepoImp.repoGlobal();
      emit(GlobalCubitSucces(globallist: data));
    } catch (e) {
      emit(GlobalCubitFailure(err: e.toString()));
    }
  }
}
