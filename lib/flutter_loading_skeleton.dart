import 'package:flutter/material.dart';

/// A widget that displays a loading skeleton animation, typically used as a placeholder
/// while content is being loaded.
///
/// This widget can be used to improve perceived performance by showing a shimmering
/// placeholder instead of a blank space. It is commonly used in lists, cards, or any
/// area where data is being fetched asynchronously.
///
/// ## Usage
/// ```dart
/// LoadingSkeleton(
///   // Customize properties as needed
/// )
/// ```
///
/// Place this widget where you want to show a loading indicator until your data is ready.
class LoadingSkeleton extends StatefulWidget {
  final Duration duration;
  final double borderRadius;
  final double height;
  final double width;
  final bool animateWidth;

  const LoadingSkeleton({
    super.key,
    this.duration = const Duration(seconds: 1),
    this.borderRadius = 8.0,
    this.height = 16.0,
    this.width = 120.0,
    this.animateWidth = false,
  });

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorTween;
  late final Animation<double> _widthTween;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _colorTween = ColorTween(
      begin: Colors.grey[300],
      end: Colors.grey[100],
    ).animate(_controller);
    if (widget.animateWidth) {
      _widthTween = Tween<double>(
        begin: widget.width,
        end: widget.width * 0.7,
      ).animate(_controller);
    } else {
      _widthTween = Tween<double>(
        begin: widget.width,
        end: widget.width,
      ).animate(_controller);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _widthTween.value,
          height: widget.height,
          decoration: BoxDecoration(
            color: _colorTween.value,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
