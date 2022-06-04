
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture{
  String medium;
  String large;
  String thumbnail;

  Picture(this.medium, this.large, this.thumbnail);

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}