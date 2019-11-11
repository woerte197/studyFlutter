// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trigger _$TriggerFromJson(Map<String, dynamic> json) {
  return Trigger()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..mother = json['mother'] as Map<String, dynamic>
    ..friends = json['friends'] as List;
}

Map<String, dynamic> _$TriggerToJson(Trigger instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mother': instance.mother,
      'friends': instance.friends
    };
