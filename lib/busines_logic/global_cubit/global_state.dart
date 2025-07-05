part of 'global_cubit.dart';

@immutable
sealed class GlobalState {}

final class GlobalCubitInitial extends GlobalState {}

final class GlobalCubitLoading extends GlobalState {}

final class GlobalCubitSucces extends GlobalState {
  final List<Articles>globallist;

  GlobalCubitSucces({required this.globallist});
}

final class GlobalCubitFailure extends GlobalState {
  final String err;

  GlobalCubitFailure({required this.err});
}
