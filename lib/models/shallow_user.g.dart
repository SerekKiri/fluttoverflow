// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shallow_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShallowUser _$ShallowUserFromJson(Map<String, dynamic> json) {
  return ShallowUser(
      json['display_name'] as String ?? '', json['profile_image'] as String);
}

Map<String, dynamic> _$ShallowUserToJson(ShallowUser instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'profile_image': instance.profileImage
    };
