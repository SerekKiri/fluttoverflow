// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
      avatarUrl: json['profile_image'] as String,
      displayName: json['display_name'] as String,
      badgeCounts: json['badge_counts'] as List,
      reputation: json['reputation'] as int,
      location: json['location'] as String,
      user_id: json['user_id'] as int);
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'profile_image': instance.avatarUrl,
      'display_name': instance.displayName,
      'badge_counts': instance.badgeCounts,
      'reputation': instance.reputation,
      'location': instance.location,
      'user_id': instance.user_id
    };
