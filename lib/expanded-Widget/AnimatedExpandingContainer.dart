import 'package:flutter/material.dart';

// Animation to show expanding and collapsed widget transition
class AnimatedExpandingContainer extends StatelessWidget {
  const AnimatedExpandingContainer({
    required this.unexpandedWidget,
    required this.expandedWidget,
    required this.isExpanded,
  })  : assert(unexpandedWidget != null),
        assert(expandedWidget != null),
        assert(isExpanded != null);

  final Widget unexpandedWidget;
  final Widget expandedWidget;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    // you can change the duration and add Curve to make more smoother transition
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      firstChild: unexpandedWidget,
      secondChild: expandedWidget,
      crossFadeState:
      !isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 800),
    );
  }
}
