import 'package:flutter/material.dart';
import 'package:oncab/components/shadow_card.dart';
import 'package:oncab/utils/Colors.dart';

import '../components/app_bar_container.dart';
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
      body: Stack(
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
                  'Ride Details',
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

          // Content Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: const Color(0xFFF5F5F5),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ShadowCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Profile and Vehicle Info
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
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
                                          fontFamily: "ProximaNova",
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Toyota Camry • ABC 123',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: "ProximaNova",
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
                                Image.asset("images/pin.png",
                                    color: Colors.grey),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '123 Pickup Street, City',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "ProximaNova",
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '2:30 PM',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "ProximaNova",
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
                                const Icon(Icons.location_on,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '455 Dropoff Avenue, Town',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "ProximaNova",
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        '3:15 PM',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "ProximaNova",
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
                    ShadowCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ride Details',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildDetailRow('Distance', '7.5 miles'),
                            const SizedBox(height: 16),
                            _buildDetailRow('Estimated Time', '45 minutes'),
                            const SizedBox(height: 16),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
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
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Start Ride',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "ProximaNova",
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'End Ride',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
            fontFamily: "ProximaNova",
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "ProximaNova",
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
