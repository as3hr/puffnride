import 'package:flutter/material.dart';
import 'package:oncab/components/app_bar_container.dart';
import 'package:oncab/components/shadow_card.dart';
import 'package:oncab/utils/Colors.dart';

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
                'Earnings',
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
                    const Text(
                      "Today's Earnings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "ProximaNova",
                      ),
                    ),
                    const SizedBox(height: 12),
                    ShadowCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildEarningRow("Total Earnings", "\$1,250"),
                            const SizedBox(height: 16),
                            _buildEarningRow("Rides Completed", "8"),
                            const SizedBox(height: 16),
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
                        fontFamily: "ProximaNova",
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
                            onPressed: () =>
                                setState(() => isWeeklySelected = true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isWeeklySelected
                                  ? primaryColor
                                  : Color(0xff9C9B9F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
                            onPressed: () =>
                                setState(() => isWeeklySelected = false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !isWeeklySelected
                                  ? primaryColor
                                  : Color(0xff9C9B9F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
                    ShadowCard(
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
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildEarningRow("Total Earnings", "\$8,750"),
                            const SizedBox(height: 16),
                            _buildEarningRow("Rides Completed", "52"),
                            const SizedBox(height: 16),
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
                          backgroundColor: Color(0xff9C9B9F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Withdraw Earnings',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                              color: Colors.white,
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
    return ShadowCard(
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
