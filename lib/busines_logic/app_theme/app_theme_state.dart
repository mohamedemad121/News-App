part of 'app_theme_cubit.dart';

sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class AppLightTheme extends AppThemeState {}

final class AppDarkTheme extends AppThemeState {}
