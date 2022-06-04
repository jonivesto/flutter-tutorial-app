
import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class Name{
  String title;
  String first;
  String last;

  Name(this.title, this.first, this.last);

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NameToJson(this);
}