import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/property.dart';
import '../utils/animations.dart';
import '../widgets/location_bar.dart';
import '../widgets/property_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<Property> _properties = Property.getSampleProperties();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerLeft,
            colors: [
              AppColors.white,
              AppColors.beigeColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top:
                  MediaQuery.of(context).size.height *
                  0.53, // Adjusted position
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          blurRadius: 10,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(
                    duration: AnimationUtils.mediumDuration,
                    delay:
                        AnimationUtils.longDelay +
                        const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  )
                  .slideY(
                    begin: 100,
                    end: 0,
                    duration: AnimationUtils.mediumDuration,
                    delay:
                        AnimationUtils.longDelay +
                        const Duration(milliseconds: 200),
                    curve: Curves.easeOutQuint,
                  ),
            ),

            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location bar with user avatar - fades in first
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LocationBar(
                      location: 'Saint Petersburg',
                      avatarUrl: 'assets/images/profile.webp',
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Greeting and headline - slides in after location bar
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, Marina',
                              style: AppTextStyles.greeting,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "let's select your\nperfect place",
                              style: AppTextStyles.headline,
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(
                        duration: AnimationUtils.mediumDuration,
                        delay: AnimationUtils.shortDelay,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: 20,
                        end: 0,
                        duration: AnimationUtils.mediumDuration,
                        delay: AnimationUtils.shortDelay,
                        curve: Curves.easeOutQuint,
                      ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        // Buy & Rent Buttons - animate one after another
                        Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Buy button
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 140,
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.accentOrange,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'BUY',
                                              style: AppTextStyles.buttonLabel,
                                            ),
                                            const SizedBox(height: 10),
                                            AnimationUtils.countUpAnimation(
                                              targetNumber: 1034,
                                              style: AppTextStyles.count,
                                              duration: const Duration(
                                                milliseconds: 2500,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'offers',
                                              style: AppTextStyles.buttonLabel,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 15),

                                  // Rent button
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 140,
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'RENT',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColors.lightBeigeColor,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            AnimationUtils.countUpAnimation(
                                              targetNumber: 2212,
                                              style: AppTextStyles.countBeige,
                                              duration: const Duration(
                                                milliseconds: 3000,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'offers',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColors.lightBeigeColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(
                              duration: AnimationUtils.mediumDuration,
                              delay:
                                  AnimationUtils.mediumDelay +
                                  const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            )
                            .slideY(
                              begin: 20,
                              end: 0,
                              duration: AnimationUtils.mediumDuration,
                              delay:
                                  AnimationUtils.mediumDelay +
                                  const Duration(milliseconds: 300),
                              curve: Curves.easeOutQuint,
                            ),

                        const SizedBox(height: 25),

                        // Featured property (larger card)
                        if (_properties.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: PropertyCard(
                                  property: _properties[0],
                                  isFeatured: true,
                                  onTap: () {},
                                )
                                .animate()
                                .fadeIn(
                                  duration: AnimationUtils.mediumDuration,
                                  delay:
                                      AnimationUtils.longDelay +
                                      const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                )
                                .slideY(
                                  begin: 30,
                                  end: 0,
                                  duration: AnimationUtils.mediumDuration,
                                  delay:
                                      AnimationUtils.longDelay +
                                      const Duration(milliseconds: 300),
                                  curve: Curves.easeOutQuint,
                                ),
                          ),

                        const SizedBox(height: 15),

                        // Custom layout for remaining properties
                        if (_properties.length > 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: SizedBox(
                              height:
                                  400, // Fixed height to contain the entire layout
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .stretch, // Make sure children stretch to fill height
                                children: [
                                  // Left side - Property 2 (full height)
                                  Expanded(
                                    child: SizedBox(
                                      height: 400, // Ensure full height
                                      child: PropertyCard(
                                            property: _properties[1],
                                            isFeatured: false,
                                            onTap: () {},
                                          )
                                          .animate()
                                          .fadeIn(
                                            duration:
                                                AnimationUtils.mediumDuration,
                                            delay:
                                                AnimationUtils.longDelay +
                                                const Duration(
                                                  milliseconds: 500,
                                                ),
                                            curve: Curves.easeOut,
                                          )
                                          .slideY(
                                            begin: 30,
                                            end: 0,
                                            duration:
                                                AnimationUtils.mediumDuration,
                                            delay:
                                                AnimationUtils.longDelay +
                                                const Duration(
                                                  milliseconds: 500,
                                                ),
                                            curve: Curves.easeOutQuint,
                                          ),
                                    ),
                                  ),

                                  const SizedBox(width: 15),

                                  // Right side - Property 3 and 4 stacked vertically
                                  if (_properties.length > 2)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          // Top property (Property 3)
                                          SizedBox(
                                            height:
                                                190, // Half of container height minus spacing
                                            child: PropertyCard(
                                                  property: _properties[2],
                                                  isFeatured: false,
                                                  onTap: () {},
                                                )
                                                .animate()
                                                .fadeIn(
                                                  duration:
                                                      AnimationUtils
                                                          .mediumDuration,
                                                  delay:
                                                      AnimationUtils.longDelay +
                                                      const Duration(
                                                        milliseconds: 650,
                                                      ),
                                                  curve: Curves.easeOut,
                                                )
                                                .slideY(
                                                  begin: 30,
                                                  end: 0,
                                                  duration:
                                                      AnimationUtils
                                                          .mediumDuration,
                                                  delay:
                                                      AnimationUtils.longDelay +
                                                      const Duration(
                                                        milliseconds: 650,
                                                      ),
                                                  curve: Curves.easeOutQuint,
                                                ),
                                          ),

                                          const SizedBox(height: 15),

                                          // Bottom property (Property 4)
                                          if (_properties.length > 3)
                                            SizedBox(
                                              height:
                                                  190, // Half of container height minus spacing
                                              child: PropertyCard(
                                                    property: _properties[3],
                                                    isFeatured: false,
                                                    onTap: () {},
                                                  )
                                                  .animate()
                                                  .fadeIn(
                                                    duration:
                                                        AnimationUtils
                                                            .mediumDuration,
                                                    delay:
                                                        AnimationUtils
                                                            .longDelay +
                                                        const Duration(
                                                          milliseconds: 800,
                                                        ),
                                                    curve: Curves.easeOut,
                                                  )
                                                  .slideY(
                                                    begin: 30,
                                                    end: 0,
                                                    duration:
                                                        AnimationUtils
                                                            .mediumDuration,
                                                    delay:
                                                        AnimationUtils
                                                            .longDelay +
                                                        const Duration(
                                                          milliseconds: 800,
                                                        ),
                                                    curve: Curves.easeOutQuint,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const BottomNavBar(currentIndex: 2, animate: true),
            ),
          ],
        ),
      ),
    );
  }
}
