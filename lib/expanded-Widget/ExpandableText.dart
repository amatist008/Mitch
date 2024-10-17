import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/expanded-Widget/AnimatedExpandingContainer.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int minLines;
  final int maxLines;
  final TextStyle textStyle;

  const ExpandableText({
    required Key key,
    required this.maxLines,
    required this.minLines,
    required this.text,
    required this.textStyle, required TextAlign textAlign,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  Widget expandableText(bool isExpanded) {
    return Text(
      widget.text,
      overflow: TextOverflow.ellipsis,
      maxLines: isExpanded ? widget.maxLines : widget.minLines,
      style: widget.textStyle, // Aplicar el estilo aquí
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: AnimatedExpandingContainer(
            isExpanded: _isExpanded,
            expandedWidget: expandableText(true),
            unexpandedWidget: expandableText(false),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  !_isExpanded ? "See more" : "See less",
                  style: GoogleFonts.roboto(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                  color: Color(0xffffffff),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
