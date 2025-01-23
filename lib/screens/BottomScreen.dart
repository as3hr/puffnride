import 'package:flutter/material.dart';
import 'package:oncab/screens/DashboardScreen.dart';
import 'package:oncab/screens/RidesListScreen.dart';
// ignore: unused_import
import 'package:oncab/screens/WalletScreen.dart';
import 'package:oncab/screens/EarningScreen.dart';
import 'package:oncab/screens/EditProfileScreen.dart';
import 'package:oncab/screens/DriverDashboardScreen.dart';
import 'package:oncab/screens/SupScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomScreen(),
    );
  }
}

class BottomScreen extends StatefulWidget {
  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DriverDashboardScreen(),
    DashboardScreen(),
    EarningScreen(),
    SupSupportScreen(),
    EditProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 66,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF462FAB),
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 17.1,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home_rounded, 'Home'),
            _buildNavItem(1, Icons.local_taxi_rounded, 'Book a Ride'),
            _buildNavItem(2, Icons.donut_large_rounded, 'Earnings'),
            _buildNavItem(3, Icons.headset_mic_rounded, 'Support'),
            _buildNavItem(4, Icons.person_rounded, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 21.88, // Set icon size
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontFamily: "Proxima Nova",
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       color: Color(0xFFCAA928),

  //       // Set the background color of the entire screen to white
  //       child: Center(
  //         child: _widgetOptions.elementAt(_selectedIndex),
  //       ),
  //     ),
  //     bottomNavigationBar: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // Container(
  //         //   // color: Color(0xFFEAEAEA),
  //         //   decoration: BoxDecoration(
  //         //     borderRadius: BorderRadius.only(
  //         //         topLeft: radiusCircular(12), topRight: radiusCircular(12)),
  //         //   ),
  //         //   padding: EdgeInsets.all(5.0),
  //         //   child: Row(
  //         //     children: [
  //         //       Expanded(
  //         //         child: Container(
  //         //           height: 85,
  //         //           // color: Colors.green[50],
  //         //           decoration: BoxDecoration(
  //         //             color: Colors.red[50],
  //         //             borderRadius:
  //         //                 BorderRadius.circular(12), // Add border radius here
  //         //             // boxShadow: [
  //         //             //   BoxShadow(
  //         //             //     color: Colors.black12,
  //         //             //     spreadRadius: 5,
  //         //             //     blurRadius: 10,
  //         //             //     offset: Offset(0, 3), // changes position of shadow
  //         //             //   ),
  //         //             // ],
  //         //           ),
  //         //           child: Container(
  //         //             padding: EdgeInsets.all(5.0),
  //         //             child: Row(
  //         //               mainAxisAlignment: MainAxisAlignment.start,
  //         //               crossAxisAlignment: CrossAxisAlignment.start,
  //         //               children: [
  //         //                 Icon(
  //         //                   Icons.info,
  //         //                   size: 20,
  //         //                 ),
  //         //                 SizedBox(width: 2),
  //         //                 Text(
  //         //                   "Pro",
  //         //                   style: TextStyle(
  //         //                     fontSize: 20,
  //         //                     fontWeight: FontWeight.bold,
  //         //                   ),
  //         //                 )
  //         //               ],
  //         //             ),
  //         //           ),
  //         //         ),
  //         //       ),
  //         //       SizedBox(width: 8),
  //         //       Expanded(
  //         //         child: Container(
  //         //           height: 75,
  //         //           decoration: BoxDecoration(
  //         //             color: Colors.blue[50],
  //         //             borderRadius:
  //         //                 BorderRadius.circular(12), // Add border radius here
  //         //             // boxShadow: [
  //         //             //   BoxShadow(
  //         //             //     color: Colors.black12,
  //         //             //     spreadRadius: 5,
  //         //             //     blurRadius: 10,
  //         //             //     offset: Offset(0, 3), // changes position of shadow
  //         //             //   ),
  //         //             // ],
  //         //           ),
  //         //           child: Container(
  //         //             child: Column(
  //         //               children: [
  //         //                 Container(
  //         //                   padding: EdgeInsets.only(left: 5.0),
  //         //                   child: Row(
  //         //                     children: [
  //         //                       Icon(
  //         //                         Icons.wallet,
  //         //                         size: 20,
  //         //                       ),
  //         //                       SizedBox(width: 2),
  //         //                       Text(
  //         //                         "Earnings",
  //         //                         style: TextStyle(
  //         //                           fontSize: 20,
  //         //                           fontWeight: FontWeight.bold,
  //         //                         ),
  //         //                       )
  //         //                     ],
  //         //                   ),
  //         //                 ),
  //         //                 Container(
  //         //                   padding: EdgeInsets.only(right: 10.0),
  //         //                   child: Row(
  //         //                     mainAxisAlignment: MainAxisAlignment.end,
  //         //                     crossAxisAlignment: CrossAxisAlignment.end,
  //         //                     children: [
  //         //                       Container(
  //         //                         child: Column(
  //         //                           mainAxisAlignment: MainAxisAlignment.start,
  //         //                           crossAxisAlignment:
  //         //                               CrossAxisAlignment.start,
  //         //                           children: [
  //         //                             SizedBox(width: 2),
  //         //                             Text(
  //         //                               "Monthly",
  //         //                               style: TextStyle(
  //         //                                 fontSize: 10,
  //         //                                 fontWeight: FontWeight.bold,
  //         //                               ),
  //         //                             ),
  //         //                             Text(
  //         //                               "Rs:5000",
  //         //                               style: TextStyle(
  //         //                                 fontSize: 16,
  //         //                                 fontWeight: FontWeight.bold,
  //         //                               ),
  //         //                             )
  //         //                           ],
  //         //                         ),
  //         //                       )
  //         //                     ],
  //         //                   ),
  //         //                 )
  //         //               ],
  //         //             ),
  //         //           ),
  //         //         ),
  //         //       ),
  //         //     ],
  //         //   ),
  //         // ),
  //         Container(
  //           height: 70, // Set the desired height
  //           decoration: BoxDecoration(
  //             // borderRadius: BorderRadius.only(
  //             //   topLeft: Radius.elliptical(10, 10),
  //             //   topRight: Radius.circular(10),
  //             // ),
  //             // color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 spreadRadius: 5,
  //                 blurRadius: 10,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           child: BottomNavigationBar(
  //             selectedLabelStyle: TextStyle(
  //               fontWeight:
  //                   FontWeight.bold, // Font weight for the selected item
  //             ),
  //             unselectedLabelStyle: TextStyle(
  //               fontWeight:
  //                   FontWeight.normal, // Font weight for unselected items
  //             ),
  //             items: const <BottomNavigationBarItem>[
  //               BottomNavigationBarItem(
  //                 icon: Icon(Icons.wallet),
  //                 label: 'Wallet',
  //               ),
  //               BottomNavigationBarItem(
  //                 icon: Icon(Icons.home_max),
  //                 label: 'Home',
  //               ),
  //               BottomNavigationBarItem(
  //                 icon: Icon(
  //                   Icons.list,
  //                   size: 30,
  //                 ),
  //                 label: 'Rides',
  //               ),
  //             ],
  //             currentIndex: _selectedIndex,
  //             selectedItemColor: Color(0xFF00155f),
  //             unselectedItemColor: Color.fromARGB(231, 196, 195, 195),
  //             selectedIconTheme: IconThemeData(color: Color(0xFF00155f)),
  //             unselectedIconTheme:
  //                 IconThemeData(color: Color.fromARGB(231, 196, 195, 195)),
  //             onTap: _onItemTapped,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
