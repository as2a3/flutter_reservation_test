// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: json['id'] as int? ?? defaultId,
      type: json['type'] as String? ?? '',
      seat: json['seat'] as String? ?? '',
      author: json['author'] == null
          ? null
          : TicketAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'seat': instance.seat,
      'author': instance.author,
    };
