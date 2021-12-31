import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
@freezed
class User with _$User {
  const User._();
  /// {@macro user}
  const factory User({
    required String id,
    String? email,
    String? name,
    String? photo,
  }) = _User;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;
}
