import 'package:flutter/material.dart';
import 'package:oncab/screens/NavigationEndScreen.dart';
import 'package:oncab/utils/Colors.dart';

import '../components/app_bar_container.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Map and AppBar Section
          Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/map_detail.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.3), BlendMode.darken)),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBarContainer(
                    child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    const Text(
                      'Navigation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova",
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                        color: Colors.white),
                  ],
                )),
              ),
            ],
          ),

          // Directions and Controls Section
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Directions Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Directions',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                          Text(
                            '25 min (5.2 km)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Turn-by-turn Instructions
                      _buildDirectionStep(
                        icon: Icons.turn_right,
                        instruction: 'Turn right on Main St',
                        detail: 'in 200 meters',
                      ),
                      const SizedBox(height: 16),
                      _buildDirectionStep(
                        icon: Icons.straight,
                        instruction: 'Continue straight for 1.5 km',
                        detail: '',
                      ),
                      const SizedBox(height: 16),
                      _buildDirectionStep(
                        icon: Icons.turn_left,
                        instruction: 'Turn left onto Oak Avenue',
                        detail: '',
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),

                      // Alternative Routes
                      const Text(
                        'Alternative Routes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova",
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildRouteOption('Fastest', isSelected: true),
                          const SizedBox(width: 12),
                          _buildRouteOption('Shortest'),
                          const SizedBox(width: 12),
                          _buildRouteOption('Eco'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Start Navigation Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavigationEndScreen(), // Replace with your screen class
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Start Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionStep({
    required IconData icon,
    required String instruction,
    required String detail,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.grey[700]),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                instruction,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProximaNova",
                ),
              ),
              if (detail.isNotEmpty)
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRouteOption(String label, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[300] : Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "ProximaNova",
            color: isSelected ? Colors.black87 : Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
