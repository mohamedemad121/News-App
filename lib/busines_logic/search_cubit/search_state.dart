part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccses extends SearchState {
  final List<Articles> news;

  SearchSuccses({required this.news});
}

class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}
