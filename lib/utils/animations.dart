import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationUtils {
  static const Duration shortDuration = Duration(milliseconds: 500);
  static const Duration mediumDuration = Duration(milliseconds: 700);
  static const Duration longDuration = Duration(milliseconds: 900);

  static const Duration shortDelay = Duration(milliseconds: 200);
  static const Duration mediumDelay = Duration(milliseconds: 400);
  static const Duration longDelay = Duration(milliseconds: 600);

  static List<Effect<dynamic>> get fadeIn => [
    FadeEffect(duration: shortDuration, curve: Curves.easeOut),
  ];

  static List<Effect<dynamic>> get slideUpFadeIn => [
    FadeEffect(duration: mediumDuration, curve: Curves.easeOut),
    SlideEffect(
      begin: const Offset(0, 20),
      end: const Offset(0, 0),
      duration: mediumDuration,
      curve: Curves.easeOutQuint,
    ),
  ];

  static List<Effect<dynamic>> get scaleIn => [
    FadeEffect(duration: shortDuration, curve: Curves.easeOut),
    ScaleEffect(
      begin: const Offset(0.95, 0.95),
      end: const Offset(1, 1),
      duration: shortDuration,
      curve: Curves.easeOutBack,
    ),
  ];

  static List<Effect<dynamic>> get bottomNavPop => [
    FadeEffect(duration: mediumDuration, curve: Curves.easeOut),
    SlideEffect(
      begin: const Offset(0, 20),
      end: const Offset(0, 0),
      duration: mediumDuration,
      curve: Curves.elasticOut,
    ),
  ];

  static Widget countUpAnimation({
    required int targetNumber,
    required TextStyle style,
    Duration? duration,
  }) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: targetNumber),
      duration: duration ?? const Duration(milliseconds: 2500),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Text(value.toString(), style: style);
      },
    );
  }
}
