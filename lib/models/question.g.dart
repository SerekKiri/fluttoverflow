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
      json['question_id'] as int);
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'body_markdown': instance.bodyMarkdown,
      'title': instance.title,
      'tags': instance.tags,
      'score': instance.score,
      'question_id': instance.id
    };
