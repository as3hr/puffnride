import 'package:flutter/material.dart';
import 'package:oncab/model/ComplaintModel.dart';
import 'package:oncab/model/DriverRatting.dart';
import 'package:oncab/model/RideHistory.dart';
import 'package:oncab/network/RestApis.dart';
import 'package:oncab/screens/RidesListScreen.dart';
import 'package:oncab/utils/Colors.dart';
import 'package:oncab/utils/Extensions/app_common.dart';

import '../components/app_bar_container.dart';
import '../components/shadow_card.dart';
import '../main.dart';
import '../model/CurrentRequestModel.dart';
import '../model/RiderModel.dart';

class RideDetailScreen extends StatefulWidget {
  final int orderId;

  RideDetailScreen({required this.orderId});

  @override
  RideDetailScreenState createState() => RideDetailScreenState();
}

class RideDetailScreenState extends State<RideDetailScreen> {
  RiderModel? riderModel;
  List<RideHistory> rideHistory = [];
  DriverRatting? riderRatting;
  ComplaintModel? complaintData;
  Payment? payment;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    appStore.setLoading(true);
    await rideDetail(orderId: widget.orderId).then((value) {
      appStore.setLoading(false);

      riderModel = value.data;
      rideHistory.addAll(value.rideHistory!);
      riderRatting = value.riderRatting;
      complaintData = value.complaintModel;
      if (value.payment != null) payment = value.payment;
      setState(() {});
    }).catchError((error) {
      appStore.setLoading(false);

      log('error:${error.toString()}');
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

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
                'Ride Requests',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ProximaNova",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          )),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ride Request Card
                  ShadowCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 8),
                              Text("123 Main St, Cityville",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "ProximaNova",
                                  )),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.flag, size: 16, color: Colors.grey),
                              SizedBox(width: 8),
                              Text("456 Oak Ave, Townsburg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "ProximaNova",
                                  )),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.attach_money,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text("Estimated Fare: \$15.50",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "ProximaNova",
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text("ETA: 10 mins",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "ProximaNova",
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RidesListScreen(), // Replace with your screen class
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[400],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: Text(
                                    "Accept",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "ProximaNova"),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: Text(
                                    "Decline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "ProximaNova",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Accepted Ride Card
                  ShadowCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1B35),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: const AssetImage('images/map_ride.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.blue.withOpacity(0.2),
                                BlendMode.softLight,
                              ),
                            ),
                          ),
                          child: Center(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "images/location.png",
                              color: Colors.blue.withOpacity(0.2),
                              colorBlendMode: BlendMode.softLight,
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text("789 Elm St, Villagetown",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "ProximaNova")),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text("John Doe",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "ProximaNova")),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.call,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Call",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.message,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Message",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.navigation,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Navigate",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(riderModel != null ? "${language.ride} #${riderModel!.id}" : "", style: boldTextStyle(color: Colors.white)),
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             launchScreen(
  //               context,
  //               ComplaintScreen(driverRatting: riderRatting ?? DriverRatting(), complaintModel: complaintData, riderModel: riderModel),
  //               pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
  //             );
  //           },
  //           icon: Icon(MaterialCommunityIcons.head_question),
  //         )
  //       ],
  //     ),
  //     body: Stack(
  //       children: [
  //         if (riderModel != null)
  //           SingleChildScrollView(
  //             padding: EdgeInsets.all(16),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 aboutRiderWidget(),
  //                 SizedBox(height: 12),
  //                 if (riderModel!.otherRiderData != null) riderDetailWidget(),
  //                 if (riderModel!.otherRiderData != null) SizedBox(height: 12),
  //                 addressComponent(),
  //                 SizedBox(height: 12),
  //                 priceDetailWidget(),
  //                 SizedBox(height: 12),
  //                 paymentDetailWidget(),
  //               ],
  //             ),
  //           ),
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

  // Widget addressComponent() {
  //   return Container(
  //     decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: dividerColor.withOpacity(0.5)), borderRadius: radius()),
  //     padding: EdgeInsets.all(12),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Icon(Ionicons.calendar, color: textSecondaryColorGlobal, size: 16),
  //                 SizedBox(width: 4),
  //                 Padding(
  //                   padding: EdgeInsets.only(top: 2),
  //                   child: Text('${printDate(riderModel!.createdAt.validate())}', style: primaryTextStyle(size: 14)),
  //                 ),
  //               ],
  //             ),
  //             inkWellWidget(
  //               onTap: () {
  //                 generateInvoiceCall(riderModel, payment: payment);
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Text(language.invoice, style: primaryTextStyle(color: primaryColor)),
  //                   SizedBox(width: 4),
  //                   Padding(
  //                     padding: EdgeInsets.only(top: 2),
  //                     child: Icon(MaterialIcons.file_download, size: 18, color: primaryColor),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16),
  //         Text('${language.distance}: ${riderModel!.distance!.toStringAsFixed(2)} ${riderModel!.distanceUnit.toString()}', style: boldTextStyle(size: 14)),
  //         SizedBox(height: 10),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(height: 2),
  //             Row(
  //               children: [
  //                 Icon(Icons.near_me, color: Colors.green, size: 18),
  //                 SizedBox(width: 4),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       if (riderModel!.startTime != null) Text(riderModel!.startTime != null ? printDate(riderModel!.startTime!) : '', style: secondaryTextStyle(size: 12)),
  //                       if (riderModel!.startTime != null) SizedBox(height: 4),
  //                       Text(riderModel!.startAddress.validate(), style: primaryTextStyle(size: 14)),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 SizedBox(width: 10),
  //                 SizedBox(
  //                   height: 30,
  //                   child: DottedLine(
  //                     direction: Axis.vertical,
  //                     lineLength: double.infinity,
  //                     lineThickness: 1,
  //                     dashLength: 2,
  //                     dashColor: primaryColor,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Icon(Icons.location_on, color: Colors.red, size: 18),
  //                 SizedBox(width: 4),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       if (riderModel!.endTime != null) Text(riderModel!.endTime != null ? printDate(riderModel!.endTime!) : '', style: secondaryTextStyle(size: 12)),
  //                       if (riderModel!.endTime != null) SizedBox(height: 4),
  //                       Text(riderModel!.endAddress.validate(), style: primaryTextStyle(size: 14)),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16),
  //         inkWellWidget(
  //           onTap: () {
  //             launchScreen(context, RideHistoryScreen(rideHistory: rideHistory), pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
  //           },
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(language.viewHistory, style: primaryTextStyle(size: 14)),
  //               Icon(Entypo.chevron_right, color: dividerColor, size: 16),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget paymentDetailWidget() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.transparent,
  //       border: Border.all(color: dividerColor.withOpacity(0.5).withOpacity(0.5)),
  //       borderRadius: radius(),
  //     ),
  //     padding: EdgeInsets.all(12),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(language.paymentDetail, style: boldTextStyle(size: 16)),
  //         SizedBox(height: 16),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(language.via, style: primaryTextStyle()),
  //             Text(paymentStatus(riderModel!.paymentType.validate()), style: boldTextStyle()),
  //           ],
  //         ),
  //         SizedBox(height: 16),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(language.status, style: primaryTextStyle()),
  //             Text(paymentStatus(riderModel!.paymentStatus.validate()), style: boldTextStyle(color: paymentStatusColor(riderModel!.paymentStatus.validate()))),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget riderDetailWidget() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         decoration: BoxDecoration(
  //           color: Colors.transparent,
  //           border: Border.all(color: dividerColor.withOpacity(0.5).withOpacity(0.5)),
  //           borderRadius: radius(),
  //         ),
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(language.riderInformation.capitalizeFirstLetter(), style: boldTextStyle()),
  //             SizedBox(height: 16),
  //             Row(
  //               children: [
  //                 Icon(Ionicons.person_outline, size: 18),
  //                 SizedBox(width: 8),
  //                 Text(riderModel!.otherRiderData!.name.validate(), style: primaryTextStyle()),
  //               ],
  //             ),
  //             SizedBox(height: 10),
  //             InkWell(
  //               onTap: () {
  //                 launchUrl(Uri.parse('tel:${riderModel!.otherRiderData!.conatctNumber.validate()}'), mode: LaunchMode.externalApplication);
  //               },
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [Icon(Icons.call_sharp, size: 18, color: Colors.green), SizedBox(width: 8), Text(riderModel!.otherRiderData!.conatctNumber.validate(), style: primaryTextStyle())],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget priceDetailWidget() {
  //   return Container(
  //     decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: dividerColor.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
  //     padding: EdgeInsets.all(12),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(language.priceDetail, style: boldTextStyle(size: 16)),
  //         SizedBox(height: 12),
  //         riderModel!.subtotal! <= riderModel!.minimumFare!
  //             ? totalCount(title:language.minimumFees, amount: riderModel!.minimumFare)
  //             : Column(
  //                 children: [
  //                   totalCount(title: language.basePrice, amount: riderModel!.baseFare),
  //                   SizedBox(height: 8),
  //                   totalCount(title:language.distancePrice, amount: riderModel!.perDistanceCharge),
  //                   SizedBox(height: 8),
  //                   totalCount(title:language.minutePrice, amount: riderModel!.perMinuteDriveCharge),
  //                   SizedBox(height: 8),
  //                   totalCount(title: language.waitingTimePrice, amount: riderModel!.perMinuteWaitingCharge),
  //                 ],
  //               ),
  //         SizedBox(height: 8),
  //         if (riderModel!.couponData != null && riderModel!.couponDiscount != 0)
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(language.couponDiscount, style: secondaryTextStyle()),
  //               Text(
  //                 "- " + printAmount(riderModel!.couponDiscount!.toStringAsFixed(digitAfterDecimal)),
  //                 style: boldTextStyle(color: Colors.green, size: 14),
  //               ),
  //             ],
  //           ),
  //         if (riderModel!.couponData != null && riderModel!.couponDiscount != 0) SizedBox(height: 8),
  //         if (payment != null && payment!.driverTips != 0) totalCount(title: language.tips, amount: payment!.driverTips),
  //         if (payment != null && payment!.driverTips != 0) SizedBox(height: 8),
  //         if (riderModel!.extraCharges!.isNotEmpty)
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(language.additionalFees, style: boldTextStyle()),
  //               ...riderModel!.extraCharges!.map((e) {
  //                 return Padding(
  //                   padding: EdgeInsets.only(top: 4, bottom: 4),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(e.key.validate().capitalizeFirstLetter(), style: secondaryTextStyle()),
  //                       Text(printAmount(e.value!.toStringAsFixed(digitAfterDecimal)), style: boldTextStyle(size: 14)),
  //                     ],
  //                   ),
  //                 );
  //               }).toList()
  //             ],
  //           ),

  //         Divider(thickness: 1),
  //         payment != null && payment!.driverTips != 0
  //             ? totalCount(title: language.total, amount: riderModel!.subtotal! + payment!.driverTips!, isTotal: true)
  //             : totalCount(title: language.total, amount: riderModel!.subtotal, isTotal: true),
  //       ],
  //     ),
  //   );
  // }

  // Widget aboutRiderWidget() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: dividerColor.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
  //     padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 8),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(language.aboutRider, style: boldTextStyle(size: 16)),
  //             // InkWell(
  //             //   onTap: () {
  //             //     showDialog(
  //             //       context: context,
  //             //       builder: (_) => AlertDialog(
  //             //         contentPadding: EdgeInsets.zero,
  //             //         content: AboutWidget(driverId: riderModel!.riderId),
  //             //       ),
  //             //     );
  //             //   },
  //             //   child: Icon(Icons.info_outline),
  //             // )
  //           ],
  //         ),
  //         SizedBox(height: 16),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(defaultRadius),
  //               child: commonCachedNetworkImage(riderModel!.riderProfileImage.validate(), height: 50, width: 50, fit: BoxFit.cover),
  //             ),
  //             SizedBox(width: 12),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(riderModel!.riderName.validate(), style: boldTextStyle()),
  //                   SizedBox(height: 4),
  //                   if (riderRatting != null)
  //                     RatingBar.builder(
  //                       direction: Axis.horizontal,
  //                       glow: false,
  //                       allowHalfRating: false,
  //                       ignoreGestures: true,
  //                       wrapAlignment: WrapAlignment.spaceBetween,
  //                       itemCount: 5,
  //                       itemSize: 16,
  //                       initialRating: double.parse(riderRatting!.rating.toString()),
  //                       itemPadding: EdgeInsets.symmetric(horizontal: 0),
  //                       itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
  //                       onRatingUpdate: (rating) {
  //                         //
  //                       },
  //                     ),
  //                   SizedBox(height: 4),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Expanded(
  //                         child: Text(riderModel!.riderContactNumber.validate(), style: primaryTextStyle(size: 14)),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           launchUrl(Uri.parse('tel:${riderModel!.riderContactNumber}'), mode: LaunchMode.externalApplication);
  //                         },
  //                         child: Container(
  //                           decoration: BoxDecoration(border: Border.all(color: dividerColor), borderRadius: radius(10)),
  //                           padding: EdgeInsets.all(4),
  //                           child: Icon(Icons.call_sharp, size: 18, color: Colors.green),
  //                         ),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
