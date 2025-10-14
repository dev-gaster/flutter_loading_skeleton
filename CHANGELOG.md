# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2024-10-14

### Fixed

- Fixed package description length to comply with pub.dev requirements (60-180 characters)
- Added missing library-level documentation comment
- Fixed example folder name from 'expample' to 'example' for proper pub.dev recognition
- These fixes should improve pub.dev score from 140/160 to 160/160

## [1.0.0] - 2024-10-14

### Added

- 🎉 **First stable release!**
- Production-ready loading skeleton widget with comprehensive features
- All documentation and examples from previous versions

### Fixed

- Package preparation for publication
- Version alignment for stable release

## [0.0.1+1] - 2024-10-14 (Pre-release)

### Added

- Comprehensive documentation improvements to meet pub.dev standards
- Enhanced Dart doc comments with detailed examples and parameter descriptions
- Extensive README with multiple usage patterns and API reference
- Feature-rich example application demonstrating various skeleton patterns:
  - Basic shapes and animations
  - List view skeletons
  - Card grid layouts
  - Real-world examples (social media, profiles, shopping, news)
- Toggle between loading and loaded states in example app
- Navigation between different example categories
- Support for light and dark themes in examples

### Changed

- Improved API documentation with comprehensive parameter descriptions
- Enhanced code examples in both library and README
- Better structured example application with multiple pages
- More detailed widget documentation with usage patterns

### Documentation

- Fixed incorrect widget names in README (SkeletonLoader → LoadingSkeleton)
- Added comprehensive usage examples for common UI patterns
- Added API reference table with all parameters
- Added visual hierarchy with proper headings and sections
- Added platform support information
- Added contribution guidelines
- Added shields/badges for package metrics

## [0.0.1] - 2024-10-01

### Added

- Initial release of `flutter_loading_skeleton` package
- `LoadingSkeleton` widget with customizable properties:
  - `height` - Control skeleton height
  - `width` - Control skeleton width
  - `borderRadius` - Customize corner rounding
  - `duration` - Animation timing control
  - `animateWidth` - Optional width animation effect
- Smooth shimmer animation between light and dark grey colors
- Flutter 3.7.2+ compatibility
- Cross-platform support (Android, iOS, Web, Windows, macOS, Linux)
- Basic example application
- MIT license
