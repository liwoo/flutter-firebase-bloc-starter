// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) {
  return _TodoEntity.fromJson(json);
}

/// @nodoc
class _$TodoEntityTearOff {
  const _$TodoEntityTearOff();

  _TodoEntity call(
      {required String id,
      required String task,
      required bool complete,
      String? note}) {
    return _TodoEntity(
      id: id,
      task: task,
      complete: complete,
      note: note,
    );
  }

  TodoEntity fromJson(Map<String, Object?> json) {
    return TodoEntity.fromJson(json);
  }
}

/// @nodoc
const $TodoEntity = _$TodoEntityTearOff();

/// @nodoc
mixin _$TodoEntity {
  String get id => throw _privateConstructorUsedError;
  String get task => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
          TodoEntity value, $Res Function(TodoEntity) then) =
      _$TodoEntityCopyWithImpl<$Res>;
  $Res call({String id, String task, bool complete, String? note});
}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res> implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  final TodoEntity _value;
  // ignore: unused_field
  final $Res Function(TodoEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? task = freezed,
    Object? complete = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      complete: complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TodoEntityCopyWith<$Res> implements $TodoEntityCopyWith<$Res> {
  factory _$TodoEntityCopyWith(
          _TodoEntity value, $Res Function(_TodoEntity) then) =
      __$TodoEntityCopyWithImpl<$Res>;
  @override
  $Res call({String id, String task, bool complete, String? note});
}

/// @nodoc
class __$TodoEntityCopyWithImpl<$Res> extends _$TodoEntityCopyWithImpl<$Res>
    implements _$TodoEntityCopyWith<$Res> {
  __$TodoEntityCopyWithImpl(
      _TodoEntity _value, $Res Function(_TodoEntity) _then)
      : super(_value, (v) => _then(v as _TodoEntity));

  @override
  _TodoEntity get _value => super._value as _TodoEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? task = freezed,
    Object? complete = freezed,
    Object? note = freezed,
  }) {
    return _then(_TodoEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      complete: complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoEntity implements _TodoEntity {
  const _$_TodoEntity(
      {required this.id,
      required this.task,
      required this.complete,
      this.note});

  factory _$_TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TodoEntityFromJson(json);

  @override
  final String id;
  @override
  final String task;
  @override
  final bool complete;
  @override
  final String? note;

  @override
  String toString() {
    return 'TodoEntity(id: $id, task: $task, complete: $complete, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.task, task) &&
            const DeepCollectionEquality().equals(other.complete, complete) &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(task),
      const DeepCollectionEquality().hash(complete),
      const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  _$TodoEntityCopyWith<_TodoEntity> get copyWith =>
      __$TodoEntityCopyWithImpl<_TodoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoEntityToJson(this);
  }
}

abstract class _TodoEntity implements TodoEntity {
  const factory _TodoEntity(
      {required String id,
      required String task,
      required bool complete,
      String? note}) = _$_TodoEntity;

  factory _TodoEntity.fromJson(Map<String, dynamic> json) =
      _$_TodoEntity.fromJson;

  @override
  String get id;
  @override
  String get task;
  @override
  bool get complete;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$TodoEntityCopyWith<_TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
