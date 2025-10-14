# flutter_loading_skeleton

[![pub package](https://img.shields.io/pub/v/flutter_loading_skeleton.svg)](https://pub.dev/packages/flutter_loading_skeleton)
[![popularity](https://img.shields.io/pub/popularity/flutter_loading_skeleton?logo=dart)](https://pub.dev/packages/flutter_loading_skeleton/score)
[![likes](https://img.shields.io/pub/likes/flutter_loading_skeleton?logo=dart)](https://pub.dev/packages/flutter_loading_skeleton/score)
[![pub points](https://img.shields.io/pub/points/flutter_loading_skeleton?logo=dart)](https://pub.dev/packages/flutter_loading_skeleton/score)

A highly customizable and lightweight loading skeleton widget for Flutter applications. Create beautiful animated placeholders while your content loads, significantly improving perceived performance and user experience.

## ✨ Features

- 🎨 **Fully Customizable** - Control width, height, border radius, colors, and animation duration
- ⚡ **Smooth Animations** - Buttery smooth shimmer effects with customizable timing
- 🎯 **Easy Integration** - Drop-in replacement for loading states in lists, cards, and forms
- 🌗 **Theme Aware** - Automatically adapts to light and dark themes
- 📱 **Responsive** - Works perfectly across all screen sizes and orientations
- 🚀 **Performance Optimized** - Lightweight with minimal impact on app performance
- 🔧 **Width Animation** - Optional animated width changes for dynamic loading effects

## 📦 Installation

Add `flutter_loading_skeleton` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_loading_skeleton: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

Import the package and start using it immediately:

```dart
import 'package:flutter_loading_skeleton/flutter_loading_skeleton.dart';

// Basic skeleton
LoadingSkeleton(
  height: 20,
  width: 200,
)

// Customized skeleton
LoadingSkeleton(
  height: 16,
  width: 150,
  borderRadius: 8.0,
  duration: Duration(seconds: 1),
)

// Animated width skeleton
SizedBox(
  width: 200,
  child: LoadingSkeleton(
    height: 20,
    animateWidth: true,
  ),
)

```

## 📚 Comprehensive Usage Examples

### Basic Skeleton Shapes

```dart
// Text line skeleton
LoadingSkeleton(
  height: 16,
  width: 200,
  borderRadius: 4,
)

// Circular avatar skeleton
LoadingSkeleton(
  height: 50,
  width: 50,
  borderRadius: 25,
)

// Card skeleton
LoadingSkeleton(
  height: 120,
  width: double.infinity,
  borderRadius: 12,
)
```

### List Item Skeleton

```dart
Widget buildListItemSkeleton() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        // Avatar skeleton
        LoadingSkeleton(
          height: 40,
          width: 40,
          borderRadius: 20,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title skeleton
              LoadingSkeleton(
                height: 16,
                width: double.infinity,
                borderRadius: 4,
              ),
              SizedBox(height: 8),
              // Subtitle skeleton
              LoadingSkeleton(
                height: 14,
                width: 150,
                borderRadius: 4,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
```

### Card Grid Skeleton

```dart
Widget buildCardSkeleton() {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          LoadingSkeleton(
            height: 120,
            width: double.infinity,
            borderRadius: 8,
          ),
          SizedBox(height: 12),
          // Title
          LoadingSkeleton(
            height: 18,
            width: double.infinity,
            borderRadius: 4,
          ),
          SizedBox(height: 8),
          // Description lines
          LoadingSkeleton(
            height: 14,
            width: double.infinity,
            borderRadius: 4,
          ),
          SizedBox(height: 4),
          LoadingSkeleton(
            height: 14,
            width: 180,
            borderRadius: 4,
          ),
        ],
      ),
    ),
  );
}
```

### Animated Width Example

```dart
// For dynamic loading effects
SizedBox(
  width: 250,
  child: LoadingSkeleton(
    height: 20,
    borderRadius: 10,
    animateWidth: true,
    duration: Duration(milliseconds: 1500),
  ),
)
```

## 🎛️ API Reference

### LoadingSkeleton Properties

| Property       | Type       | Default                | Description                          |
| -------------- | ---------- | ---------------------- | ------------------------------------ |
| `height`       | `double`   | `16.0`                 | Height of the skeleton widget        |
| `width`        | `double`   | `120.0`                | Width of the skeleton widget         |
| `borderRadius` | `double`   | `8.0`                  | Corner radius for rounded rectangles |
| `duration`     | `Duration` | `Duration(seconds: 1)` | Animation cycle duration             |
| `animateWidth` | `bool`     | `false`                | Enable width animation effect        |

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_loading_skeleton/flutter_loading_skeleton.dart';

class MyLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading Skeleton Demo')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: LoadingSkeleton(
              height: 40,
              width: 40,
              borderRadius: 20,
            ),
            title: LoadingSkeleton(
              height: 16,
              width: 200,
            ),
            subtitle: LoadingSkeleton(
              height: 14,
              width: 150,
            ),
          );
        },
      ),
    );
  }
}
```

## 🎨 Theming & Customization

The skeleton automatically adapts to your app's theme, using appropriate colors for light and dark modes. The animation smoothly transitions between `Colors.grey[300]` and `Colors.grey[100]` by default.

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🤝 Contributing

For more information about the package, please visit the [GitHub repository](https://github.com/devgaster/flutter_loading_skeleton).

If you'd like to contribute to the package, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear messages.
4. Submit a pull request.

To file issues or request features, please use the [GitHub Issues](https://github.com/devgaster/flutter_loading_skeleton/issues) page.

The package authors strive to respond to issues and pull requests in a timely manner, but please be patient as they may have other commitments.
