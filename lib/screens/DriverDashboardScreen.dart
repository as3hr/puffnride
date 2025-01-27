import 'package:flutter/material.dart';
import 'package:oncab/components/app_bar_container.dart';
import 'package:oncab/components/shadow_card.dart';
import 'package:oncab/utils/Colors.dart';

import 'RideDetailScreen.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarContainer(
              child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'images/menu.png',
              ),
              Spacer(),
              const Text(
                'Driver Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ProximaNova",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 20, color: Colors.grey[600]),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 80,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ride Management Section
                  const Text(
                    'Ride Management',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RideDetailScreen(
                            orderId: 1,
                          ),
                        ),
                      );
                    },
                    child: ShadowCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'New Ride Request',
                                  style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      '2 min ago',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "ProximaNova",
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffD9D9D9),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'John D. - 3.2 miles away',
                              style: TextStyle(
                                fontFamily: "ProximaNova",
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Spacer(),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff958F8F),
                                    side: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  child: Text(
                                    'Decline',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "ProximaNova",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                  ),
                                  child: const Text(
                                    'Accept',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "ProximaNova",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Ride Status
                  const SizedBox(height: 24),
                  ShadowCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text(
                          'New Ride Request',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      _buildStatusCard('Upcoming', '2'),
                      _buildStatusCard('Active', '1'),
                      _buildStatusCard('Completed', '8'),
                    ],
                  )),

                  // Earnings Management
                  const SizedBox(height: 24),
                  const Text(
                    'Earnings Management',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const SizedBox(height: 12),
                  ShadowCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text(
                              'Total Earnings',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            trailing: const Text(
                              '\$1,234.56',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            minTileHeight: 0,
                            minVerticalPadding: 10,
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                            title: Text(
                              'Last Payout:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            minTileHeight: 0,
                            minVerticalPadding: 10,
                            trailing: Text(
                              '\$750.00 05/15/2024',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff63616D),
                                foregroundColor: Colors.black87,
                              ),
                              child: const Text(
                                'View Earnings Report',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ProximaNova",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Navigation & Mapping
                  const SizedBox(height: 24),
                  const Text(
                    'Navigation & Mapping',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const SizedBox(height: 12),
                  ShadowCard(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1B35),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: const AssetImage('images/map_dark.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.blue.withOpacity(0.2),
                                BlendMode.softLight,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Current Location',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "ProximaNova",
                                    ),
                                  ),
                                  Text(
                                    '123 Main St, City',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "ProximaNova",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff63616D),
                                  ),
                                  child: const Text(
                                    'Start Navigation',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "ProximaNova",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Safety & Security
                  const SizedBox(height: 24),
                  const Text(
                    'Safety & Security',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const SizedBox(height: 12),
                  ShadowCard(
                      child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Emergency Alert',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          title: Text(
                            'Service Chat',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )),

                  // Analytics & Reporting
                  const SizedBox(height: 24),
                  const Text(
                    'Analytics & Reporting',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  const SizedBox(height: 12),
                  ShadowCard(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Ride Acceptance Rate',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LinearProgressIndicator(
                                color: primaryColor,
                                value: 0.95,
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                '95%',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova",
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(height: 2),
                        ListTile(
                          title: const Text(
                            'Average Rating',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                4,
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                              Icon(Icons.star_border, size: 16),
                              const SizedBox(width: 4),
                              const Text('4.8'),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
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

  Widget _buildStatusCard(String title, String count) {
    return ListTile(
      minTileHeight: 0,
      minVerticalPadding: 10,
      title: Text(title),
      trailing: CircleAvatar(
        backgroundColor: Color(0xffE2D9FF),
        radius: 12,
        child: Text(
          count,
          style: const TextStyle(
            color: Color(0xff3E3D3D),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
