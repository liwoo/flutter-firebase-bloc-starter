import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(bool isDark) : super(false);

  void toggleTheme() => emit(!state);
}
