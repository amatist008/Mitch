import 'package:flutter/material.dart';
import 'package:mitchtest/components/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isThird;
  final bool isPast;
  final  eventCard;



  const TimeLine({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isThird,
    required this.isPast,
    required this.eventCard,

  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: TimelineTile(
          isFirst: isFirst,
        isLast: isLast,



        //decorate de lines
         beforeLineStyle:   LineStyle(color: Color(0xff758B9C).withOpacity(0.4)),
        indicatorStyle: IndicatorStyle(
          width: 23,
          color: Color(0xff758B9C).withOpacity(0.6),
          iconStyle: IconStyle(
              iconData: Icons.circle_rounded,
              color: Color(0xff9EC9D9).withOpacity(0.6),
          ),
        ),
        endChild: EventCard(
          isPast: isPast,
          Child: eventCard,
        ),
      ),

    );

  }
}
