// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
      json['body_markdown'] as String ?? '',
      json['score'] as int,
      json['answer_id'] as int,
      json['owner'] == null
          ? null
          : ShallowUser.fromJson(json['owner'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'body_markdown': instance.bodyMarkdown,
      'score': instance.score,
      'owner': instance.owner,
      'answer_id': instance.id
    };
