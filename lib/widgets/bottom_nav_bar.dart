import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import '../utils/animations.dart';
import '../screens/home_screen.dart';
import '../screens/map_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool animate;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    this.animate = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget navBar = Padding(
      padding: const EdgeInsets.fromLTRB(55, 0, 55, 16),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF212121),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, CupertinoIcons.search, 'Map', context),
            _buildNavItem(1, Icons.chat_bubble_rounded, 'Chat', context),
            _buildNavItem(2, Icons.home_filled, 'Home', context),
            _buildNavItem(3, Icons.favorite_rounded, 'Favorites', context),
            _buildNavItem(4, Icons.person_rounded, 'Profile', context),
          ],
        ),
      ),
    );

    if (animate) {
      navBar = navBar
          .animate()
          .fadeIn(
            duration: AnimationUtils.mediumDuration,
            delay: const Duration(milliseconds: 2800),
          )
          .slideY(
            begin: 20,
            end: 0,
            duration: AnimationUtils.mediumDuration,
            delay: const Duration(milliseconds: 2700),
            curve: Curves.easeOut,
          );
    }

    return navBar;
  }

  Widget _buildNavItem(
    int index,
    IconData iconData,
    String label,
    BuildContext context,
  ) {
    final bool isSelected = index == currentIndex;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == currentIndex) return;

          switch (index) {
            case 0: // Map
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MapScreen()),
              );
              break;
            case 1: // Chat
              // No action for now
              break;
            case 2: // Home
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              break;
            case 3: // Favorites
              // No action for now
              break;
            case 4: // Profile
              // No action for now
              break;
          }
        },
        child: Center(
          child:
              isSelected
                  ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.accentOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(iconData, color: Colors.white, size: 24),
                  )
                  : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(iconData, color: Colors.white, size: 20),
                  ),
        ),
      ),
    );
  }
}
