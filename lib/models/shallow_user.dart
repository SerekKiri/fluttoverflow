import 'package:json_annotation/json_annotation.dart';

part 'shallow_user.g.dart';

@JsonSerializable()
class ShallowUser {
  @JsonKey(name: 'display_name', nullable: true, defaultValue: "")
  final String displayName;

  @JsonKey(name: 'profile_image')
  final String profileImage;

  ShallowUser(this.displayName, this.profileImage);

  factory ShallowUser.fromJson(Map<String, dynamic> json) => _$ShallowUserFromJson(json);

  Map<String, dynamic> toJson() => _$ShallowUserToJson(this);
}