part of 'list_cubit.dart';

@immutable
sealed class ListCubitState {}

final class ListCubitInitial extends ListCubitState {}

final class ListCubitLoading extends ListCubitState {}

final class ListCubitSucces extends ListCubitState {
  final List<Articles> articles;

  ListCubitSucces({required this.articles});
}

final class ListCubitFailure extends ListCubitState {
  final String error;

  ListCubitFailure({required this.error});
}
