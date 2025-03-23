import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/animations.dart';

class LocationBar extends StatelessWidget {
  final String location;
  final String avatarUrl;

  const LocationBar({
    super.key,
    required this.location,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Animate(
            effects: [
              CustomEffect(
                duration: const Duration(milliseconds: 1200),
                builder: (context, value, child) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5 * value,
                    child: child,
                  );
                },
              ),
            ],
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Animate(
                effects: [
                  FadeEffect(
                    begin: 0,
                    end: 1,
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 1000),
                  ),
                ],
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: AppColors.lightBeigeColor,
                      size: 20,
                    ).animate().scale(
                      begin: const Offset(0.1, 0.1),
                      end: const Offset(1.0, 1.0),
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 1000),
                      curve: Curves.elasticOut,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(location, style: AppTextStyles.locationBar),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.accentOrange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentOrange.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25,
                  );
                },
              ),
            ),
          ).animate().scale(
            begin: const Offset(0.1, 0.1),
            end: const Offset(1.0, 1.0),
            duration: const Duration(milliseconds: 1200),
            delay: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
          ),
        ],
      ),
    );
  }
}
