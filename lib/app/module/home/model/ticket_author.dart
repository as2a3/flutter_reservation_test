import 'package:booking/app/module/home/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_author.g.dart';

/// Hotel model class
@JsonSerializable()
class TicketAuthor extends BaseModel {
  /// Constructor
  TicketAuthor({
    int id = defaultId,
    this.name = '',
    this.thumbnail = '',
  }) {
    super.id = id;
  }

  /// fromJson: Used to parse data from json
  factory TicketAuthor.fromJson(Map<String, dynamic> json) =>
      _$TicketAuthorFromJson(json);

  /// name: the title of the address
  late String name;

  /// thumbnail: the logo or image for the the author
  late String thumbnail;

  @override
  Map<String, dynamic> toJson() => _$TicketAuthorToJson(this);
}
