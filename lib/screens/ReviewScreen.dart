import 'package:flutter/material.dart';
import 'package:oncab/main.dart';
import 'package:oncab/screens/DetailScreen.dart';
import 'package:oncab/screens/DashboardScreen.dart';
import 'package:oncab/utils/Extensions/StringExtensions.dart';
import '../model/CurrentRequestModel.dart';
import '../network/RestApis.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/app_common.dart';

class ReviewScreen extends StatefulWidget {
  final int rideId;
  final CurrentRequestModel currentData;

  ReviewScreen({required this.rideId, required this.currentData});

  @override
  ReviewScreenState createState() => ReviewScreenState();
}

class ReviewScreenState extends State<ReviewScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController reviewController = TextEditingController();

  num rattingData = 0;
  Payment? paymentData;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  // Future<void> userReviewData() async {
  //   if (formKey.currentState!.validate()) {
  //     hideKeyboard(context);
  //     if (rattingData == 0) return toast(language.pleaseSelectRating);
  //     formKey.currentState!.save();
  //     hideKeyboard(context);
  //     appStore.setLoading(true);
  //     Map req = {
  //       "ride_request_id": widget.rideId,
  //       "rating": rattingData,
  //       "comment": reviewController.text.trim(),
  //     };
  //     await ratingReview(request: req).then((value) {
  //       getRiderCheck();
  //       appStore.setLoading(false);
  //     }).catchError((error) {
  //       appStore.setLoading(false);
  //       log(error.toString());
  //     });
  //   }
  // }

  Future<void> getRiderCheck() async {
    appStore.setLoading(false);
    await rideDetail(orderId: widget.rideId).then((value) {
      if (value.payment != null && value.payment!.paymentStatus == PENDING) {
        launchScreen(context, DetailScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      } else {
        launchScreen(context, DashboardScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      }
    }).catchError((error) {
      appStore.setLoading(false);

      toast(error.toString());
    });
  }

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
          'RWSupport',
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
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Text(language.howWasYourRide,
  //           style: boldTextStyle(color: Colors.white)),
  //     ),
  //     body: Stack(
  //       children: [
  //         SingleChildScrollView(
  //           padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
  //           child: Form(
  //             key: formKey,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(35),
  //                       child: commonCachedNetworkImage(
  //                           widget.currentData.rider!.profileImage.validate(),
  //                           fit: BoxFit.fill,
  //                           height: 70,
  //                           width: 70),
  //                     ),
  //                     SizedBox(width: 16),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         SizedBox(height: 8),
  //                         Text(
  //                             '${widget.currentData.rider!.firstName.validate()} ${widget.currentData.rider!.lastName.validate()}',
  //                             style: boldTextStyle()),
  //                         SizedBox(height: 8),
  //                         Text(widget.currentData.rider!.email.validate(),
  //                             style: secondaryTextStyle()),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 32),
  //                 RatingBar.builder(
  //                   glowColor: Colors.red,
  //                   direction: Axis.horizontal,
  //                   glow: true,
  //                   allowHalfRating: true,
  //                   wrapAlignment: WrapAlignment.spaceBetween,
  //                   itemCount: 5,
  //                   itemPadding: EdgeInsets.symmetric(horizontal: 8),
  //                   itemBuilder: (context, _) =>
  //                       Icon(Icons.star, color: Colors.amber),
  //                   unratedColor: Colors.grey[50],
  //                   onRatingUpdate: (rating) {
  //                     rattingData = rating;
  //                     print(rattingData);
  //                   },
  //                 ),
  //                 SizedBox(height: 32),
  //                 Text(language.addReviews,
  //                     style: boldTextStyle(color: primaryColor)),
  //                 SizedBox(height: 16),
  //                 AppTextField(
  //                   controller: reviewController,
  //                   decoration: inputDecoration(context,
  //                       label: language.writeYourComments),
  //                   textFieldType: TextFieldType.NAME,
  //                   textInputAction: TextInputAction.done,
  //                   minLines: 2,
  //                   maxLines: 5,
  //                 ),
  //                 SizedBox(height: 16),
  //                 AppButtonWidget(
  //                   text: language.continueD,
  //                   width: MediaQuery.of(context).size.width,
  //                   onTap: () {
  //                     userReviewData();
  //                   },
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Observer(builder: (context) {
  //           return Visibility(
  //             visible: appStore.isLoading,
  //             child: loaderWidget(),
  //           );
  //         })
  //       ],
  //     ),
  //   );
  // }
}
