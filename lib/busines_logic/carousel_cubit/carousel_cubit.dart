import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/data/repositry/home_repo_imp.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  final HomeRepoImp homeRepoImp;
  CarouselCubit(this.homeRepoImp) : super(CarouselCubitInitial());
  Future<void> repoCarusel() async {
    try {
      emit(CarouselCubitLoading());
      final data = await homeRepoImp.repoCarusel();
      emit(CarouselCubitSucces(articles: data));
    } on Exception catch (e) {
      emit(CarouselCubitFailure(error: e.toString()));
    }
  }
}
