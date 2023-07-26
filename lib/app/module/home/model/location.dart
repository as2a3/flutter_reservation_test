import 'package:booking/app/module/home/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

/// Location model class
@JsonSerializable()
class Location extends BaseModel {
  /// Constructor
  Location({
    int id = defaultId,
    this.name = '',
    this.address = '',
    this.latitude = 0,
    this.longitude = 0,
  }) {
    super.id = id;
  }

  /// fromJson: Used to parse data from json
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// name: the title of the address
  late String name;

  /// address: the address in details
  late String address;

  /// latitude
  late double latitude;

  /// longitude
  late double longitude;

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
