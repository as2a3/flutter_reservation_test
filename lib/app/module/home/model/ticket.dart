import 'package:booking/app/module/home/model/base_model.dart';
import 'package:booking/app/module/home/model/ticket_author.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

/// Hotel model class
@JsonSerializable()
class Ticket extends BaseModel {
  /// Constructor
  Ticket({
    int id = defaultId,
    this.type = '',
    this.seat = '',
    TicketAuthor? author,
  }) {
    super.id = id;
    this.author = author ?? TicketAuthor();
  }

  /// fromJson: Used to parse data from json
  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);

  /// name: the title of the address
  late String type;

  /// thumbnail: the logo or image for the the author
  late String seat;

  /// author: Author of the ticket
  late TicketAuthor author;

  @override
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
