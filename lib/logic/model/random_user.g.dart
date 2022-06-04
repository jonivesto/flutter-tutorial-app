// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomUser _$RandomUserFromJson(Map<String, dynamic> json) => RandomUser(
      json['gender'] as String,
      json['email'] as String,
      json['nat'] as String,
      json['phone'] as String,
      Name.fromJson(json['name'] as Map<String, dynamic>),
      Picture.fromJson(json['picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RandomUserToJson(RandomUser instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'nat': instance.nat,
      'name': instance.name,
      'picture': instance.picture,
    };
