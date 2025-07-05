import 'package:newsapp/data/model/news_model.dart';

abstract class HomeRepo {
  Future<List<Articles>> repoSearch({required String endPoint});
   Future<List<Articles>> repoCarusel();
   Future<List<Articles>> repoList();
    Future<List<Articles>> repoGlobal();
}
