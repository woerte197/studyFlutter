import 'package:json_annotation/json_annotation.dart';

part 'trigger.g.dart';

@JsonSerializable()
class Trigger {
    Trigger();

    String name;
    String email;
    Map<String,dynamic> mother;
    List friends;
    
    factory Trigger.fromJson(Map<String,dynamic> json) => _$TriggerFromJson(json);
    Map<String, dynamic> toJson() => _$TriggerToJson(this);
}
