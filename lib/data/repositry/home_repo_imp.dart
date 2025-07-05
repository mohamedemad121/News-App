import 'package:newsapp/data/api_service/api_service.dart';
import 'package:newsapp/data/model/news_model.dart';
import 'package:newsapp/data/repositry/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});

  @override
  Future<List<Articles>> repoSearch({required String endPoint}) async {
    try {
      var data = await apiService.serviceSearch(
        endPoint:
            'top-headlines?country=us&category=$endPoint&apiKey=38d521cc5bde4f0aac9941eed721b0b3',
      );
      List<Articles> news = [];
      for (var element in data['articles']) {
        news.add(Articles.fromJson(element));
      }
      return news;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Articles>> repoCarusel() async {
    try {
      final data = await apiService.serviceSearch(
        endPoint:
            'top-headlines?country=us&category=science&apiKey=38d521cc5bde4f0aac9941eed721b0b3',
      );
      List<Articles> news = [];
      for (var element in data['articles']) {
        news.add(Articles.fromJson(element));
      }
      return news;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Articles>> repoList() async {
    try {
      final data = await apiService.serviceSearch(
        endPoint:
            'top-headlines?country=us&entertainment=sports&apiKey=38d521cc5bde4f0aac9941eed721b0b3',
      );
      List<Articles> list = [];
      for (var element in data['articles']) {
        list.add(Articles.fromJson(element));
      }
      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Articles>> repoGlobal() async {
    try {
      final data = await apiService.serviceSearch(
        endPoint:
            'top-headlines?country=us&category=science&apiKey=38d521cc5bde4f0aac9941eed721b0b3',
      );
      List<Articles> global = [];
      for (var element in data['articles']) {
        global.add(Articles.fromJson(element));
      }
      return global;
    } catch (e) {
      return [];
    }
  }
}
