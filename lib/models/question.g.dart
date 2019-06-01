// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
      json['body_markdown'] as String ?? '',
      json['title'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['score'] as int,
      json['question_id'] as int,
      json['owner'] == null
          ? null
          : ShallowUser.fromJson(json['owner'] as Map<String, dynamic>),
      json['answers'] == null
          ? null
          : Answer.fromJson(json['answers'] as Map<String, dynamic>));
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'body_markdown': instance.bodyMarkdown,
      'title': instance.title,
      'tags': instance.tags,
      'score': instance.score,
      'owner': instance.owner,
      'answers': instance.answers,
      'question_id': instance.id
    };
