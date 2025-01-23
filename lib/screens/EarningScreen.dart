import 'package:flutter/material.dart';

import '../main.dart';
import '../model/EarningListModelWeek.dart';
import '../network/RestApis.dart';
import '../utils/Extensions/app_common.dart';

class EarningScreen extends StatefulWidget {
  @override
  EarningScreenState createState() => EarningScreenState();
}

class EarningScreenState extends State<EarningScreen> {
  EarningListModelWeek? earningListModelWeek;
  List<WeekReport> weekReport = [];

  num totalRideCount = 0;
  num totalCashRide = 0;
  num totalWalletRide = 0;
  num totalCardRide = 0;
  num totalEarnings = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    appStore.setLoading(true);
    Map req = {
      "type": "week",
    };
    await earningList(req: req).then((value) {
      appStore.setLoading(false);

      totalRideCount = value.totalRideCount!;
      totalCashRide = value.totalCashRide!;
      totalWalletRide = value.totalWalletRide!;
      totalCardRide = value.totalCardRide!;
      totalEarnings = value.totalEarnings!;

      weekReport.addAll(value.weekReport!);
      setState(() {});
    }).catchError((error) {
      appStore.setLoading(false);

      log(error.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool isWeeklySelected = true;

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
          'Earnings',
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
              const Text(
                "Today's Earnings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildEarningRow("Total Earnings", "\$1,250"),
                      const Divider(height: 24),
                      _buildEarningRow("Rides Completed", "8"),
                      const Divider(height: 24),
                      _buildEarningRow("Hours Online", "6.5"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Recent Rides",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildRideCard("Ride #1234", "Today, 14:30", "\$180"),
              const SizedBox(height: 8),
              _buildRideCard("Ride #1233", "Today, 12:15", "\$150"),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => isWeeklySelected = true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isWeeklySelected
                            ? const Color(0xFF5A3FFF)
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Weekly',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => isWeeklySelected = false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isWeeklySelected
                            ? const Color(0xFF5A3FFF)
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Monthly',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "This Week",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildEarningRow("Total Earnings", "\$8,750"),
                      const Divider(height: 24),
                      _buildEarningRow("Rides Completed", "52"),
                      const Divider(height: 24),
                      _buildEarningRow("Hours Online", "38.5"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Withdraw Earnings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEarningRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRideCard(String title, String time, String amount) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.directions_car, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 3,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text(language.earning, style: boldTextStyle(color: appTextPrimaryColorWhite)),
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
  //               unselectedLabelColor: primaryColor,
  //               labelStyle: boldTextStyle(color: Colors.white, size: 14),
  //               tabs: [
  //                 Text(language.today),
  //                 Text(language.weekly),
  //                 Text(language.report),
  //               ],
  //             ),
  //           ),
  //           Expanded(
  //             child: TabBarView(
  //               children: [
  //                 EarningTodayWidget(),
  //                 EarningWeekWidget(),
  //                 EarningReportWidget(),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
