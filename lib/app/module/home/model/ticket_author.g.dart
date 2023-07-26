// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAuthor _$TicketAuthorFromJson(Map<String, dynamic> json) => TicketAuthor(
      id: json['id'] as int? ?? defaultId,
      name: json['name'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$TicketAuthorToJson(TicketAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
    };
