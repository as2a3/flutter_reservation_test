// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as int? ?? defaultId,
      title: json['title'] as String? ?? '',
      hotel: json['hotel'] == null
          ? null
          : Hotel.fromJson(json['hotel'] as Map<String, dynamic>),
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      rooms: json['rooms'] as int? ?? 0,
      checkIn: json['check_in'] == null
          ? null
          : DateTime.parse(json['check_in'] as String),
      checkOut: json['check_out'] == null
          ? null
          : DateTime.parse(json['check_out'] as String),
      description: json['description'] as String? ?? '',
      amenities: json['amenities'] as String? ?? '',
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Ticket>[],
      reservations: (json['reservations'] as List<dynamic>?)
              ?.map((e) => Reservation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Reservation>[],
    )..gallery =
        (json['gallery'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hotel': instance.hotel,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'rooms': instance.rooms,
      'check_in': instance.checkIn?.toIso8601String(),
      'check_out': instance.checkOut?.toIso8601String(),
      'description': instance.description,
      'amenities': instance.amenities,
      'tickets': instance.tickets,
      'reservations': instance.reservations,
      'gallery': instance.gallery,
    };
