import 'package:flutter/material.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5A3FFF),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Driver Dashboard'),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 20, color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ride Management Section
            const Text(
              'Ride Management',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '2:30 PM',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.grey[700],
                            ),
                            child: const Text('Decline'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5A3FFF),
                            ),
                            child: const Text('Accept'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Ride Status
            const SizedBox(height: 24),
            const Text(
              'Ride Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildStatusCard('Upcoming', '2'),
            const SizedBox(height: 8),
            _buildStatusCard('Active', '1'),
            const SizedBox(height: 8),
            _buildStatusCard('Completed', '8'),

            // Earnings Management
            const SizedBox(height: 24),
            const Text(
              'Earnings Management',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Earnings',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$1,234.56',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Last Payout: \$750.00 05/15/2024',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black87,
                        ),
                        child: const Text('View Earnings Report'),
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
              ),
            ),
            const SizedBox(height: 12),
            Card(
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
                        image: const AssetImage('assets/map_dark.png'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Current Location'),
                            Text(
                              'Updated: 1m ago',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
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
                              backgroundColor: const Color(0xFF5A3FFF),
                            ),
                            child: const Text('Start Navigation'),
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
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Emergency Alert'),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('Service Chat'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),

            // Analytics & Reporting
            const SizedBox(height: 24),
            const Text(
              'Analytics & Reporting',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Ride Acceptance Rate'),
                    trailing: const Text('95%'),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text('Average Rating'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('4.8'),
                        const SizedBox(width: 4),
                        Icon(Icons.star, size: 16, color: Colors.amber[700]),
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
    );
  }

  Widget _buildStatusCard(String title, String count) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF5A3FFF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            count,
            style: const TextStyle(
              color: Color(0xFF5A3FFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}