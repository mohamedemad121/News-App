part of 'carousel_cubit.dart';

@immutable
sealed class CarouselState {}

final class CarouselCubitInitial extends CarouselState {}

final class CarouselCubitLoading extends CarouselState {}

final class CarouselCubitSucces extends CarouselState {
  final List<Articles> articles;

  CarouselCubitSucces({required this.articles});
}

final class CarouselCubitFailure extends CarouselState {
  final String error;

  CarouselCubitFailure({required this.error});
}
