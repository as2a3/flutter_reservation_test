import 'package:booking/app/module/home/model/base_model.dart';
import 'package:booking/app/module/home/model/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

/// Hotel model class
@JsonSerializable()
class Hotel extends BaseModel {
  /// Constructor
  Hotel({
    int id = defaultId,
    this.name = '',
    this.cover = '',
    this.stars = 0,
    Location? location,
  }) {
    super.id = id;
    this.location = location ?? Location();
  }

  /// fromJson: Used to parse data from json
  factory Hotel.fromJson(Map<String, dynamic> json) =>
      _$HotelFromJson(json);

  /// name: the title of the address
  late String name;

  /// cover: the logo or image for the hotel
  late String cover;

  /// starts: Hotel stars
  late double stars;

  /// location: Object from Location class, refers to the location for the hotel
  late Location location;

  @override
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}
