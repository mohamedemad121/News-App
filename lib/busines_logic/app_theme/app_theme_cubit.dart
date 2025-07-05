import 'package:bloc/bloc.dart';
import 'package:newsapp/cache/cache_helper.dart';
import 'package:newsapp/data/model/enum/theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) async {
    switch (state) {
      case ThemeState.initial:
        final savedTheme = CacheHelper.getTheme();
        if (savedTheme == 'dark') {
          emit(AppDarkTheme());
        } else {
          emit(AppLightTheme());
        }
        break;
      case ThemeState.light:
        emit(AppLightTheme());
        await CacheHelper.saveTheme('light');
        break;
      case ThemeState.dark:
        emit(AppDarkTheme());
        await CacheHelper.saveTheme('dark');

        break;
    }
  }
}
