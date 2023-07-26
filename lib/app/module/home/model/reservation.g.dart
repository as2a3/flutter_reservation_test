// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      id: json['id'] as int? ?? defaultId,
      roomType: json['room_type'] as String? ?? '',
      roomNumber: json['room_number'] as String? ?? '',
      sleeps: json['sleeps'] as int? ?? 0,
      guests: (json['guests'] as List<dynamic>?)
              ?.map((e) => Guest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Guest>[],
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_type': instance.roomType,
      'room_number': instance.roomNumber,
      'sleeps': instance.sleeps,
      'guests': instance.guests,
    };
