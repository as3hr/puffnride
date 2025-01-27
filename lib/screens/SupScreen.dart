import 'package:flutter/material.dart';
import 'package:oncab/screens/incident_report_screen.dart';

import '../components/app_bar_container.dart';
import '../components/shadow_card.dart';

class SupSupportScreen extends StatelessWidget {
  const SupSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarContainer(
              child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Spacer(),
              const Text(
                'Support',
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 80,
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search events, stand up...',
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Quick Actions
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildQuickActionCard(
                            icon: "images/chat.png",
                            title: 'Chat with Support',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildQuickActionCard(
                            icon: "images/call.png",
                            title: 'Call Support',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // FAQ Section
                    const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFAQItem('How do I reset my password?'),
                    _buildFAQItem('How do update my profile?'),
                    _buildFAQItem('Where can I find my order history?'),
                    const SizedBox(height: 24),

                    // Training Guides
                    const Text(
                      'Training Guides',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildTrainingItem(
                      icon: Icons.videocam,
                      title: 'Getting Started Tutorial',
                      subtitle: '5 min video',
                    ),
                    _buildTrainingItem(
                      icon: Icons.description,
                      title: 'User manual',
                      subtitle: 'PDF Guide',
                    ),
                    _buildTrainingItem(
                      icon: Icons.description,
                      title: 'Incident Report',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IncidentReportScreen(),
                          ),
                        );
                      },
                      subtitle: null,
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

  Widget _buildQuickActionCard({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ShadowCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(icon, width: 24, height: 24),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontFamily: "ProximaNova",
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String title) {
    return ShadowCard(
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: "ProximaNova",
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildTrainingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    void Function()? onTap,
  }) {
    return ShadowCard(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffE3DDF4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 24, color: Colors.black),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: "ProximaNova",
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontFamily: "ProximaNova",
                ),
              )
            : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
