
import 'package:esimerkki_app/logic/model/picture.dart';
import 'package:json_annotation/json_annotation.dart';

import 'name.dart';

part 'random_user.g.dart';

@JsonSerializable()
class RandomUser{
  String gender;
  String email;
  String phone;
  String nat;
  Name name;
  Picture picture;

  RandomUser(this.gender, this.email, this.nat, this.phone, this.name, this.picture);

  factory RandomUser.fromJson(Map<String, dynamic> json) => _$RandomUserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RandomUserToJson(this);
}