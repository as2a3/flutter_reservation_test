import 'package:booking/app/module/home/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

/// Hotel model class
@JsonSerializable()
class Guest extends BaseModel {
  /// Constructor
  Guest({
    int id = defaultId,
    this.name = '',
    this.thumbnail = '',
  }) {
    super.id = id;
  }

  /// fromJson: Used to parse data from json
  factory Guest.fromJson(Map<String, dynamic> json) =>
      _$GuestFromJson(json);

  /// name: the title of the address
  late String name;

  /// thumbnail: the logo or image for the the guest
  late String thumbnail;

  @override
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
