import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/app/module/home/model/ticket.dart';
import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// TicketsWidget
class TicketsWidget extends StatelessWidget {
  /// Constructor
  const TicketsWidget({
    required this.tickets,
    super.key,
  });

  /// tickets
  final List<Ticket> tickets;

  @override
  Widget build(BuildContext context) {
    if (tickets.isEmpty) {
      return const Offstage();
    }
    return ListTileItemWidget(
      title: 'Tickets:',
      subTitleWidget: _TicketsListViewWidget(tickets: tickets),
    );
  }
}

class _TicketsListViewWidget extends StatelessWidget {
  const _TicketsListViewWidget({
    required this.tickets,
  });

  final List<Ticket> tickets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tickets.length,
      itemBuilder: (context, index) => _TicketItemWidget(
        ticket: tickets[index],
      ),
    );
  }
}

class _TicketItemWidget extends StatelessWidget {
  const _TicketItemWidget({
    required this.ticket,
  });

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    const radius = 12.0;
    return Container(
      color: Get.theme.hintColor,
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          ListTile(
            minLeadingWidth: 12,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: radius,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(radius)),
                child: CachedNetworkImage(
                  height: radius * 2,
                  width: radius * 2,
                  fit: BoxFit.cover,
                  imageUrl: ticket.author.thumbnail,
                  placeholder: (context, url) => Image.asset(
                    Assets.img.loading.path,
                    fit: BoxFit.cover,
                    height: radius * 2,
                    width: radius * 2,
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                ),
              ),
            ),
            title: Text(
              ticket.author.name,
              style: Get.textTheme.headlineMedium,
            ),
            subtitle: Text(
              '#${ticket.author.id}',
              style: Get.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: isDarkMode
                    ? const Color(0xFF9A9A9A)
                    : const Color(0x661A1A1A),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Get.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: 14,
                width: 7,
              ),
              Expanded(
                child: ColoredBox(
                  color: Get.theme.primaryColor,
                  child: DottedLine(
                    dashColor: Get.theme.hintColor,
                    dashLength: 5,
                    dashGapColor: Get.theme.scaffoldBackgroundColor,
                    dashGapLength: 5,
                    lineThickness: 2,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Get.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                height: 14,
                width: 7,
              ),
            ],
          ),
          8.ph,
          Row(
            children: [
              16.pw,
              Text(
                'Ticket Type:',
                style: Get.textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Text(
                  ticket.type,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: isDarkMode
                        ? const Color(0xFF9A9A9A)
                        : const Color(0x661A1A1A),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          5.ph,
          Row(
            children: [
              16.pw,
              Text(
                'Seat:',
                style: Get.textTheme.titleLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Text(
                  ticket.seat,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: isDarkMode
                        ? const Color(0xFF9A9A9A)
                        : const Color(0x661A1A1A),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          8.ph,
        ],
      ),
    );
  }
}
