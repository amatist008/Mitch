import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final  Child;
   const EventCard({
     super.key,
     required this.isPast,
     required this.Child,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(25),
      padding:  EdgeInsets.only(top: 16, left: 20, bottom: 16, right: 20),
      decoration: BoxDecoration(//box decoration
        borderRadius: BorderRadius.circular(20),
        color:isPast ? Color(0xff446C81).withOpacity(0.4): Color(0xff3EADD6),
      ),
      child: Child,
    );
  }
}
