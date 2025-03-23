import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/property.dart';
import '../utils/animations.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Property> _properties = Property.getSampleProperties();
  LayerType _activeLayer = LayerType.price;

  IconData get _activeLayerIcon {
    switch (_activeLayer) {
      case LayerType.cosyAreas:
        return Icons.check;
      case LayerType.price:
        return Icons.account_balance_wallet;
      case LayerType.infrastructure:
        return Icons.business;
      case LayerType.none:
      default:
        return Icons.layers_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background using an image
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                // Map image as background
                Image.asset(
                  'assets/images/map.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Property markers
                ..._buildMarkers(),
              ],
            ),
          ),

          // Top search bar
          Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 20,
                right:
                    80, // Reduced width to make room for separate filter button
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      const Icon(Icons.search, color: AppColors.grey),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Saint Petersburg',
                          style: AppTextStyles.searchBar,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate()
              .fadeIn(
                duration: AnimationUtils.mediumDuration,
                delay:
                    AnimationUtils.shortDelay +
                    const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              )
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1, 1),
                duration: AnimationUtils.mediumDuration,
                delay:
                    AnimationUtils.shortDelay +
                    const Duration(milliseconds: 200),
                curve: Curves.easeOutQuad,
              ),

          // Filter button (separate from search field)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.tune, color: AppColors.grey),
                onPressed: () {},
              ),
            ),
          ),

          // Bottom left buttons
          Positioned(
            left: 20,
            bottom: 110, // Increased from 100 to lift buttons higher
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        _showLayerOptions(context);
                      },
                      child: Center(
                        child: Icon(_activeLayerIcon, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.location,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(
            duration: AnimationUtils.mediumDuration,
            delay:
                AnimationUtils.shortDelay + const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          ),

          // Bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const BottomNavBar(currentIndex: 0, animate: false),
          ),

          // List of Variants button (moved up and to the right)
          Positioned(
                bottom: 110, // Increased from 25 to move upward
                left:
                    MediaQuery.of(context).size.width /
                    2, // Align to right half of screen
                right: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(
                      0.9,
                    ), // Changed to medium grey with slight transparency
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical:
                          8, // Reduced from 12 to make button slightly shorter
                      horizontal: 16,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.list,
                        color: Colors.white,
                      ), // Updated icon color to white
                      const SizedBox(width: 10),
                      const Text(
                        'List of variants',
                        style: TextStyle(
                          color: Colors.white, // Updated text color to white
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate()
              .fadeIn(
                duration: AnimationUtils.mediumDuration,
                delay:
                    AnimationUtils.shortDelay +
                    const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              )
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1, 1),
                duration: AnimationUtils.mediumDuration,
                delay:
                    AnimationUtils.shortDelay +
                    const Duration(milliseconds: 200),
                curve: Curves.easeOutQuad,
              ),
        ],
      ),
    );
  }

  List<Widget> _buildMarkers() {
    List<Widget> markers = [];

    final List<Map<String, double>> positions = [
      {'left': 50, 'top': 220},
      {'left': 180, 'top': 240},
      {'left': 300, 'top': 260},
      {'left': 150, 'top': 320},
    ];

    // Position the original properties at specific locations
    for (int i = 0; i < _properties.length && i < positions.length; i++) {
      final position = positions[i];
      markers.add(
        Positioned(
          left: position['left']!,
          top: position['top']!,
          child: _buildPropertyMarker(_properties[i]),
        ),
      );
    }

    markers.add(
      Positioned(
        left: 250,
        top: 380,
        child: _buildPropertyMarker(
          Property(
            id: 'extra1',
            address: '789 Waterfront Ave',
            imageUrl: 'assets/images/property1.jpg',
            latitude: 59.942,
            longitude: 30.318,
            isForSale: true,
            isForRent: false,
            price: 450000,
          ),
        ),
      ),
    );

    markers.add(
      Positioned(
        left: 120,
        top: 450,
        child: _buildPropertyMarker(
          Property(
            id: 'extra2',
            address: '567 Urban St',
            imageUrl: 'assets/images/property2.jpg',
            latitude: 59.935,
            longitude: 30.325,
            isForSale: false,
            isForRent: true,
            price: 320000,
          ),
        ),
      ),
    );

    return markers;
  }

  Widget _buildPropertyMarker(Property property) {
    return GestureDetector(
      onTap: () {
        // Empty onTap handler - no action when clicked
      },
      child:
          _activeLayer == LayerType.price
              ? _buildPriceMarker(property)
              : Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.zero, // Flat bottom left corner
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentOrange.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.apartment, color: Colors.white, size: 20),
              ).animate().scale(
                duration: const Duration(milliseconds: 500),
                delay:
                    AnimationUtils.shortDelay +
                    const Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
              ),
    );
  }

  Widget _buildPriceMarker(Property property) {
    final priceText = '\$${property.price ~/ 1000}K';
    return Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.accentOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.zero, // Flat bottom left corner
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accentOrange.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            priceText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
        .animate()
        .scale(
          duration: const Duration(milliseconds: 500),
          delay: AnimationUtils.shortDelay + const Duration(milliseconds: 800),
          curve: Curves.easeOutBack,
        )
        .fadeIn(
          duration: const Duration(milliseconds: 400),
          delay: AnimationUtils.shortDelay + const Duration(milliseconds: 800),
        );
  }
}

// Layer type enum
enum LayerType { cosyAreas, price, infrastructure, none }

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

    double spacing = 30;
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw vertical lines
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Layer options popup
extension MapLayerOptions on _MapScreenState {
  void _showLayerOptions(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

    final RelativeRect position = RelativeRect.fromLTRB(
      20, // Left position
      buttonPosition.dy + 430, // Top position above the button
      20, // Right position
      20, // Bottom position
    );

    showMenu(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      items: [
        PopupMenuItem(
          enabled: true,
          child: Row(
            children: [
              Icon(Icons.check, color: Colors.black54),
              const SizedBox(width: 10),
              Text('Cosy areas', style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color:
                    _activeLayer == LayerType.price
                        ? AppColors.accentOrange
                        : Colors.black54,
              ),
              const SizedBox(width: 10),
              Text(
                'Price',
                style: TextStyle(
                  color:
                      _activeLayer == LayerType.price
                          ? AppColors.accentOrange
                          : Colors.black87,
                ),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              _activeLayer = LayerType.price;
            });
          },
        ),
        PopupMenuItem(
          enabled: true,
          child: Row(
            children: [
              Icon(Icons.business, color: Colors.black54),
              const SizedBox(width: 10),
              Text('Infrastructure', style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.layers_outlined,
                color:
                    _activeLayer == LayerType.none
                        ? AppColors.accentOrange
                        : Colors.black54,
              ),
              const SizedBox(width: 10),
              Text(
                'Without any layer',
                style: TextStyle(
                  color:
                      _activeLayer == LayerType.none
                          ? AppColors.accentOrange
                          : Colors.black87,
                ),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              _activeLayer = LayerType.none;
            });
          },
        ),
      ],
    );
  }
}
