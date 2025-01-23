import 'package:flutter/material.dart';
import '../model/WalkThroughModel.dart';
import '../utils/Constants.dart';
import '../utils/Images.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  List<WalkThroughModel> walkThroughClass = [
    WalkThroughModel(
      name: walk_title1,
      text: walk_desc1,
      img: ic_walk1,
    ),
    WalkThroughModel(
      name: walk_title2,
      text: walk_desc2,
      img: ic_walk2,
    ),
    WalkThroughModel(
      name: walk_title3,
      text: walk_desc3,
      img: ic_walk3,
    )
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5A3FFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'WKSupport',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search events, stand up...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
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
                      icon: Icons.chat_bubble_outline,
                      title: 'Chat with Support',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionCard(
                      icon: Icons.phone_outlined,
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
                icon: Icons.play_circle_outline,
                title: 'Getting Started Tutorial',
                subtitle: '5 min video',
              ),
              _buildTrainingItem(
                icon: Icons.description_outlined,
                title: 'User manual',
                subtitle: 'PDF Guide',
              ),
              _buildTrainingItem(
                icon: Icons.description_outlined,
                title: 'Incident Report',
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 24, color: Colors.grey[700]),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
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
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
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
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 24, color: Colors.grey[700]),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              )
            : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         PageView.builder(
  //           itemCount: walkThroughClass.length,
  //           controller: pageController,
  //           itemBuilder: (context, i) {
  //             return Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 Image.asset(
  //                   walkThroughClass[i].img.toString(),
  //                   fit: BoxFit.cover,
  //                   width: MediaQuery.of(context).size.width,
  //                   height: MediaQuery.of(context).size.height,
  //                 ),
  //                 Positioned(
  //                   bottom: 120,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       Text(walkThroughClass[i].name!, style: boldTextStyle(size: 30, color: Colors.white), textAlign: TextAlign.center),
  //                       SizedBox(height: 16),
  //                       Text(walkThroughClass[i].text.toString(), style: secondaryTextStyle(size: 14, color: Colors.white), textAlign: TextAlign.center),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //           onPageChanged: (int i) {
  //             currentPage = i;
  //             setState(() {});
  //           },
  //         ),
  //         Positioned(
  //           bottom: 20,
  //           right: 16,
  //           left: 16,
  //           child: Column(
  //             children: [
  //               dotIndicator(walkThroughClass, currentPage),
  //               SizedBox(height: 16),
  //               GestureDetector(
  //                 onTap: () {
  //                   if (currentPage.toInt() >= 2) {
  //                     launchScreen(context, SignInScreen(), isNewTask: true);
  //                     sharedPref.setBool(IS_FIRST_TIME, false);
  //                   } else {
  //                     pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
  //                   }
  //                 },
  //                 child: Container(
  //                   decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
  //                   padding: EdgeInsets.all(12),
  //                   child: Icon(Icons.arrow_forward, color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Positioned(
  //           top: 40,
  //           right: 0,
  //           child: TextButton(
  //             onPressed: () {
  //               launchScreen(context, SignInScreen(), isNewTask: true);
  //               sharedPref.setBool(IS_FIRST_TIME, false);
  //             },
  //             child: Text(language.skip, style: boldTextStyle(color: Colors.white)),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
