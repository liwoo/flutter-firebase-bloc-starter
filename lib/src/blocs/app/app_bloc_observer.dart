import 'package:bloc/bloc.dart';
import 'package:firebase_bloc_starter/src/repositories/event_repository/events_repository.dart';

class AppBlocObserver extends BlocObserver {
  EventsRepository repository;

  AppBlocObserver({required this.repository});

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    repository.track("Event", {"event": event.runtimeType.toString()});
    print(event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    repository.track("Error", {"event": error});
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
