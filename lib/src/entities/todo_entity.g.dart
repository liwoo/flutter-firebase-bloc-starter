// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoEntity _$$_TodoEntityFromJson(Map<String, dynamic> json) =>
    _$_TodoEntity(
      id: json['id'] as String,
      task: json['task'] as String,
      complete: json['complete'] as bool,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_TodoEntityToJson(_$_TodoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'complete': instance.complete,
      'note': instance.note,
    };
