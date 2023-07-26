import 'package:booking/app/module/home/model/base_model.dart';
import 'package:booking/app/module/home/model/guest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

/// Hotel model class
@JsonSerializable()
class Reservation extends BaseModel {
  /// Constructor
  Reservation({
    int id = defaultId,
    this.roomType = '',
    this.roomNumber = '',
    this.sleeps = 0,
    this.guests = const <Guest>[],
  }) {
    super.id = id;
  }

  /// fromJson: Used to parse data from json
  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  /// room_type: the type of the reservation
  @JsonKey(name: 'room_type')
  late String roomType;

  /// room_number: the room number
  @JsonKey(name: 'room_number')
  late String roomNumber;

  /// sleeps: the number of the sleeps
  late int sleeps;

  /// guests: the guests in the reservation
  late List<Guest> guests;

  @override
  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}
