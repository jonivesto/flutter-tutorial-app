// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      json['medium'] as String,
      json['large'] as String,
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'medium': instance.medium,
      'large': instance.large,
      'thumbnail': instance.thumbnail,
    };
