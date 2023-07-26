import 'package:flutter/material.dart';

/// ExpandedSection
class ExpandedSection extends StatefulWidget {
  /// Constructor
  const ExpandedSection({
    required this.child,
    this.expand = false,
    this.axisAlignment = 1.0,
    this.axis = Axis.vertical,
    super.key,
  });

  /// child
  final Widget child;

  /// expand
  final bool expand;

  /// axisAlignment
  final double axisAlignment;

  /// axis
  final Axis axis;

  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: widget.axisAlignment,
      sizeFactor: animation,
      axis: widget.axis,
      child: widget.child,
    );
  }
}
