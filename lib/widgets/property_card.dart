import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/property.dart';

class PropertyCard extends StatefulWidget {
  final Property property;
  final VoidCallback onTap;
  final bool isFeatured;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
    this.isFeatured = false,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  bool _showName = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showName = true;
        });
      }
    });
  }

  void startSlideAnimation() {
    if (mounted && !_controller.isAnimating && !_showName) {
      _controller.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    int baseDelay = 2300;


    Future.delayed(Duration(milliseconds: baseDelay), () {
      startSlideAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.isFeatured ? 220 : 180,
        margin: EdgeInsets.only(bottom: widget.isFeatured ? 0 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Property image
            Positioned.fill(
              child: Image.asset(
                widget.property.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.grey.withOpacity(0.2),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.grey,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Slider for property name
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                child: AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    final double sliderWidth = widget.isFeatured ? 280 : 146;
                    final double sliderHeight = widget.isFeatured ? 55 : 42;
                    final double circleSize = widget.isFeatured ? 40 : 35;
                    final double fontSize = widget.isFeatured ? 14 : 12;
                    final double nameSize = widget.isFeatured ? 17 : 11;

                    return Container(
                      width: sliderWidth,
                      height: sliderHeight,
                      decoration: BoxDecoration(
                        color: Colors.grey[100]!.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(sliderHeight / 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Slider indicator
                          Positioned(
                            left:
                                _slideAnimation.value *
                                (sliderWidth - circleSize),
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                width: circleSize,
                                height: circleSize,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: widget.isFeatured ? 13 : 10,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          if (_showName)
                            Align(
                              alignment:
                                  widget.isFeatured
                                      ? Alignment.center
                                      : Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    widget.isFeatured
                                        ? const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        )
                                        : const EdgeInsets.only(left: 15),
                                child: Text(
                                  widget.property.address,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: nameSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign:
                                      widget.isFeatured
                                          ? TextAlign.center
                                          : TextAlign.left,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
