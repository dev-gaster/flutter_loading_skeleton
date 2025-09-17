# flutter_loading_skeleton

`flutter_loading_skeleton` provides customizable skeleton loading widgets for Flutter applications. Use this package to display animated placeholders while your app loads data, improving perceived performance and user experience. The package can be used to create a variety of skeleton layouts, including lists, grids, and cards, with smooth shimmer effects. User-friendly and easy to integrate, `flutter_loading_skeleton` is perfect for enhancing the loading experience in your Flutter apps.

## Features

- Customizable skeleton widgets for lists, grids, and cards
- Smooth shimmer animation for loading placeholders
- Easy integration with existing Flutter widgets
- Support for light and dark themes
- Lightweight and fast performance
- Flexible API for advanced customization

## Getting started

To use this package, add `flutter_loading_skeleton` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_loading_skeleton: ^0.0.1
```

Then, run `flutter pub get` to install the package.

## Usage

Import the package in your Dart code:

```dart
import 'package:flutter_loading_skeleton/flutter_loading_skeleton.dart';

// Example usage of Skeleton widget
SkeletonLoader(
    width: 200,
    height: 20,
)

// Example specifying radius. Radius is a double value.
SkeletonLoader(
    width: 200,
    height: 20,
    borderRadius: 12.0,
)

// Example specifying duration. Duration is a Duration value.
SkeletonLoader(
    width: 200,
    height: 20,
    duration: Duration(milliseconds: 1200),
)

// Example animating width
SizedBox(
    width: 200,
    child: SkeletonLoader(
        height: 20,
        animateWidth: true,
    ),
)

```

## Additional information

For more information about the package, please visit the [GitHub repository](https://github.com/devgaster/flutter_loading_skeleton).

If you'd like to contribute to the package, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear messages.
4. Submit a pull request.

To file issues or request features, please use the [GitHub Issues](https://github.com/devgaster/flutter_loading_skeleton/issues) page.

The package authors strive to respond to issues and pull requests in a timely manner, but please be patient as they may have other commitments.
