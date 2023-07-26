import 'package:booking/app/module/home/model/base_model.dart';
import 'package:booking/app/module/home/model/hotel.dart';
import 'package:booking/app/module/home/model/reservation.dart';
import 'package:booking/app/module/home/model/ticket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

/// Booking model class
@JsonSerializable()
class Booking extends BaseModel {
  /// Constructor
  Booking({
    int id = defaultId,
    this.title = '',
    Hotel? hotel,
    this.from,
    this.to,
    this.rooms = 0,
    this.checkIn,
    this.checkOut,
    this.description = '',
    this.amenities = '',
    this.tickets = const <Ticket>[],
    this.reservations = const <Reservation>[],
  }) {
    super.id = id;
    this.hotel = hotel ?? Hotel();
  }

  /// fromJson: Used to parse data from json
  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  /// title: the title of the booking
  late String title;

  /// hotel
  late Hotel hotel;

  /// from: Starting of reservation
  DateTime? from;

  /// from: Ending of reservation
  DateTime? to;

  /// rooms: Rooms count
  int rooms;

  /// checkIn: The date of check in
  @JsonKey(name: 'check_in')
  DateTime? checkIn;

  /// checkOut: The date of check out
  @JsonKey(name: 'check_out')
  DateTime? checkOut;

  /// description: the description
  late String description;

  /// amenities: the amenities
  late String amenities;

  /// tickets: The tickets of the booking
  late List<Ticket> tickets;

  /// reservations: The reservations of the booking
  late List<Reservation> reservations;

  /// gallery: The booking gallery
  late List<String> gallery;

  @override
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
