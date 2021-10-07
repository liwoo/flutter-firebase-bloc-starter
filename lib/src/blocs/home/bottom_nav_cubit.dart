import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) => emit(index);

  void getHome() => emit(0);
  void getNotification() => emit(1);
  void getSettings() => emit(2);
}
