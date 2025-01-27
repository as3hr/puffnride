import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oncab/components/shadow_card.dart';

import '../components/app_bar_container.dart';
import '../components/input_field.dart';

class IncidentReportScreen extends StatefulWidget {
  const IncidentReportScreen({super.key});

  @override
  State<IncidentReportScreen> createState() => _IncidentReportScreenState();
}

class _IncidentReportScreenState extends State<IncidentReportScreen> {
  String? selectedIncidentType;
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
              SizedBox(width: 120),
              Center(
                child: const Text(
                  'Safety',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ProximaNova",
                  ),
                ),
              ),
              Spacer(),
            ],
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ShadowCard(
                        child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFFF0000),
                                    Color(0xFFBF1B1B),
                                    Color(0xffEC2020),
                                    Color(0xffB60505),
                                    Color(0xff921515),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'Alert',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            const Text(
                              'Press the panic button to send alerts to admin and emergency contacts',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    ShadowCard(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Incident Reporting Forum',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            SizedBox(height: 16),
                            const Text(
                              'Incident Type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              height: 40,
                              child: DropdownButtonFormField<String>(
                                value: selectedIncidentType,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 8),
                                  suffixIcon:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                ),
                                iconSize: 0,
                                items: ["Accident", "Passenger Issue", "Others"]
                                    .map((String year) {
                                  return DropdownMenuItem<String>(
                                    value: year,
                                    child: Text(year),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedIncidentType = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select the vehicle Type';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            InputField(
                              label: "Description",
                              onChanged: (val) {},
                              hintText: "Describe the Incident",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your description';
                                }
                                return null;
                              },
                            ),
                            InputField(
                              label: "Location",
                              onChanged: (val) {},
                              hintText: "Enter Incident Location",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter location';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            const Text(
                              'Attach Photo',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                              ),
                            ),
                            SizedBox(height: 4),
                            GestureDetector(
                                onTap: () => {},
                                child: DottedBorder(
                                  color: Color(0xffC9C9C9),
                                  strokeWidth: 2.5,
                                  dashPattern: [15, 4],
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(14.5),
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.5),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'images/camera.png')),
                                          SizedBox(height: 4),
                                          Text(
                                            "Tap to take a photo or upload",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff716C6C),
                                            ),
                                          )
                                        ],
                                      )),
                                )),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff494949),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Submit Report',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
