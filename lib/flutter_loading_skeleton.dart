import 'package:flutter/material.dart';

/// A highly customizable loading skeleton widget that displays animated placeholders
/// while content is being loaded.
///
/// This widget creates smooth shimmer animations that transition between light and dark
/// grey colors, providing visual feedback during loading states. It's perfect for
/// improving perceived performance in lists, cards, forms, and any UI element that
/// requires data fetching.
///
/// ## Basic Usage
/// ```dart
/// LoadingSkeleton(
///   height: 20,
///   width: 200,
///   borderRadius: 8.0,
/// )
/// ```
///
/// ## Advanced Usage with Animation
/// ```dart
/// // Animate width for dynamic loading effect
/// SizedBox(
///   width: 250,
///   child: LoadingSkeleton(
///     height: 16,
///     borderRadius: 4,
///     animateWidth: true,
///     duration: Duration(milliseconds: 1500),
///   ),
/// )
/// ```
///
/// ## Common Patterns
///
/// ### Text Line Skeleton
/// ```dart
/// LoadingSkeleton(height: 16, width: 200, borderRadius: 4)
/// ```
///
/// ### Circular Avatar Skeleton
/// ```dart
/// LoadingSkeleton(height: 50, width: 50, borderRadius: 25)
/// ```
///
/// ### Card Image Skeleton
/// ```dart
/// LoadingSkeleton(height: 120, width: double.infinity, borderRadius: 12)
/// ```
///
/// The skeleton automatically adapts to your app's theme and provides consistent
/// animation timing across all instances.
class LoadingSkeleton extends StatefulWidget {
  /// The animation cycle duration. Controls how fast the shimmer effect repeats.
  ///
  /// Shorter durations create faster, more noticeable animations, while longer
  /// durations provide subtle, gentle effects. Default is 1 second.
  final Duration duration;

  /// The corner radius for rounded rectangle shapes.
  ///
  /// Use 0 for sharp corners, or half of height/width for circular shapes.
  /// Default is 8.0 for slightly rounded corners.
  final double borderRadius;

  /// The height of the skeleton widget in logical pixels.
  ///
  /// This determines the vertical space the skeleton occupies.
  /// Default is 16.0, suitable for text line placeholders.
  final double height;

  /// The width of the skeleton widget in logical pixels.
  ///
  /// This determines the horizontal space the skeleton occupies.
  /// Use `double.infinity` to fill available width.
  /// Default is 120.0, suitable for short text placeholders.
  final double width;

  /// Whether to animate the width during the shimmer cycle.
  ///
  /// When enabled, the skeleton will smoothly animate between the full width
  /// and 70% of the width, creating a dynamic loading effect. The skeleton
  /// should be wrapped in a SizedBox to control the maximum width.
  ///
  /// Default is false for consistent, static width.
  final bool animateWidth;

  /// Creates a loading skeleton widget with customizable properties.
  ///
  /// All parameters are optional and have sensible defaults for common use cases.
  ///
  /// Example:
  /// ```dart
  /// LoadingSkeleton(
  ///   height: 20,
  ///   width: 180,
  ///   borderRadius: 10,
  ///   duration: Duration(milliseconds: 800),
  ///   animateWidth: true,
  /// )
  /// ```
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
