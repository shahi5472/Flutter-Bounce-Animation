import 'package:flutter/material.dart';

class BouncingContainer extends StatefulWidget {
  const BouncingContainer({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 200),
    this.scale = 0.8,
  })  : assert(
          scale >= 0.0 && scale <= 1.0,
          "The valid range of scale is from 0.0 to 1.0.",
        ),
        super(key: key);

  final Widget child;
  final Duration duration;
  final Duration reverseDuration;
  final double scale;

  @override
  State<BouncingContainer> createState() => _BouncingContainerState();
}

class _BouncingContainerState extends State<BouncingContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
    reverseDuration: widget.reverseDuration,
    value: 1.0,
    upperBound: 1.0,
    lowerBound: widget.scale,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
    reverseCurve: Curves.decelerate,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.reverse().then((_) {
      _controller.forward();
    });
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: _onTapCancel,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: _onTap,
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
