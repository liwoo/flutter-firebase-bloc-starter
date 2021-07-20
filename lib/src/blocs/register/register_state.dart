part of 'package:firebase_bloc_starter/src/blocs/register/register_cubic.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
  });

  final FormzStatus status;

  @override
  List<Object> get props => [status];

  RegisterState copyWith({
    FormzStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
