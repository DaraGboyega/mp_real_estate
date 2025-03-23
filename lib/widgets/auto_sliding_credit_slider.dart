import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AutoSlidingCreditSlider extends StatefulWidget {
  final Duration startAnimation;

  const AutoSlidingCreditSlider({super.key, required this.startAnimation});

  @override
  State<AutoSlidingCreditSlider> createState() =>
      _AutoSlidingCreditSliderState();
}

class _AutoSlidingCreditSliderState extends State<AutoSlidingCreditSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  bool _showName = false;

  final double _sliderWidth = 300.0;
  final double _handleSize = 60.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<double>(
        begin: 0.0,
        end: _sliderWidth - _handleSize,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showName = true;
          });
        }
      });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _sliderWidth,
      height: _handleSize,
      child: Stack(
        children: [
          // Base track
          Container(
            width: _sliderWidth,
            height: _handleSize,
            decoration: BoxDecoration(
              color: AppColors.beigeColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: _showName ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: const Text(
                "Slide to continue",
                style: TextStyle(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Positioned(
                left: _slideAnimation.value,
                top: 0,
                child: AnimatedOpacity(
                  opacity: _showName ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: _handleSize,
                    height: _handleSize,
                    decoration: BoxDecoration(
                      color: AppColors.accentOrange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              );
            },
          ),

          Center(
            child: AnimatedOpacity(
              opacity: _showName ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accentOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Enjoy your properties!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
