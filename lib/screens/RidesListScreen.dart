import 'package:flutter/material.dart';

import '../utils/Constants.dart';
import 'package:oncab/screens/NavigationScreen.dart';

class RidesListScreen extends StatefulWidget {
  @override
  RidesListScreenState createState() => RidesListScreenState();
}

class RidesListScreenState extends State<RidesListScreen> {
  int currentPage = 1;
  int totalPage = 1;
  List<String> riderStatus = [COMPLETED, CANCELED];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Map Section with AppBar
          Stack(
            children: [
              // Map Container
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://placeholder.com/map'), // Replace with actual map
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Custom AppBar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Ride Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Expanded(
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rider Info Card
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Profile and Vehicle Info
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(
                                      'https://placeholder.com/user'),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'John Doe',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Toyota Camry • ABC 123',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Pickup Location
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '123 Pickup Street, City',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '2:30 PM',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Dropoff Location
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '455 Dropoff Avenue, Town',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '3:15 PM',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Ride Details Card
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ride Details',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow('Distance', '7.5 miles'),
                            const Divider(height: 24),
                            _buildDetailRow('Estimated Time', '45 minutes'),
                            const Divider(height: 24),
                            _buildDetailRow('Fare', '\$25.50'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavigationScreen(), // Replace with your screen class
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5A3FFF),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Start Ride',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'End Ride',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: riderStatus.length,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text(language.rides, style: boldTextStyle(color: appTextPrimaryColorWhite)),
  //       ),
  //       body: Column(
  //         children: [
  //           Container(
  //             height: 40,
  //             margin: EdgeInsets.only(right: 16, left: 16, top: 16),
  //             decoration: BoxDecoration(color: Colors.transparent,border: Border.all(color: dividerColor), borderRadius: radius()),
  //             child: TabBar(
  //               indicator: BoxDecoration(borderRadius: radius(), color: primaryColor),
  //               labelColor: Colors.white,
  //               unselectedLabelColor: primaryColor,indicatorSize: TabBarIndicatorSize.tab,
  //               labelStyle: boldTextStyle(color: Colors.white, size: 14),
  //               tabs: riderStatus.map((e) {
  //                 return Tab(
  //                   child: Text(changeStatusText(e)),
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           Expanded(
  //             child: TabBarView(
  //               children: riderStatus.map((e) {
  //                 return CreateTabScreen(status: e);
  //               }).toList(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
