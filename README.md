# Real Estate App UI

A Flutter implementation of a real estate app UI design with smooth animations and an iOS-like look and feel.

## Features

- Home Screen with animated components:
  - Location selector + user avatar (fades in first)
  - Greeting + headline (slides in after location bar)
  - Buy & Rent buttons with animated count-up
  - Property cards with iOS-style arrow animations
  - Bottom navigation bar with floating action button

- Map Screen:
  - Dark-themed map with property markers
  - Rounded search bar with filter icon
  - Floating navigation buttons
  - List of variants button
  - Bottom navigation with floating action button

## Getting Started

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Install dependencies:
```
flutter pub get
```
4. Run the app:
```
flutter run
```

## Implementation Details

### Color Palette
```dart
const Color darkColor = Color(0xFF232220);
const Color beigeColor = Color(0xFFF5E9DE);
const Color goldColor = Color(0xFFA58F5E);
const Color accentOrange = Color(0xFFF5A623);
```

### Important Note

This app requires real image assets to display properly. The current implementation uses placeholder image files. To see the full design, replace the placeholder images in the `assets/images/` directory with actual property and avatar images.

## Dependencies

- flutter_animate: For smooth, sequenced animations
- google_maps_flutter: For the interactive map experience
- animated_text_kit: For animated text elements
- flutter_sequence_animation: For coordinating complex animation sequences
