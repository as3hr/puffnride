import 'package:flutter/material.dart';
import 'package:oncab/components/shadow_card.dart';
import 'package:oncab/utils/Colors.dart';

import '../components/app_bar_container.dart';

class NavigationEndScreen extends StatelessWidget {
  const NavigationEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Map and AppBar Section
          Stack(
            children: [
              // Map Container
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

          // Ride Details Section
          Expanded(
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    // Details Card
                    ShadowCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Directions',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Destination Row
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Destination',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "ProximaNova",
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'in 0 meters',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: "ProximaNova",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Divider(),
                            const SizedBox(height: 16),
                            // Time Taken Row
                            _buildDetailRow('Time Taken', '23.4 Mints'),
                            const SizedBox(height: 16),
                            // Distance Row
                            _buildDetailRow('Distance', '5.24 Km'),
                            const SizedBox(height: 16),
                            const Divider(),
                            const SizedBox(height: 16),
                            // Payable Amount Row
                            _buildDetailRow('Payable Amount', '\$55.23',
                                isAmount: true),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // End Ride Button
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16), // Ensure proper bottom padding
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'End Ride',
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isAmount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontFamily: "ProximaNova",
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isAmount ? 16 : 14,
            fontFamily: "ProximaNova",
            fontWeight: isAmount ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
