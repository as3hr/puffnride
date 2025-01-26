import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oncab/Services/AuthService.dart';
import 'package:oncab/components/input_field.dart';
import 'package:oncab/components/submission_button.dart';
import 'package:oncab/main.dart';
import 'package:oncab/utils/Extensions/StringExtensions.dart';
import '../model/ServiceModel.dart';
import '../network/RestApis.dart';
import '../utils/Common.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/app_common.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'BottomScreen.dart';

class SignUpScreen extends StatefulWidget {
  final bool isOtp;
  final bool socialLogin;

  final String? countryCode;
  final String? privacyPolicyUrl;
  final String? termsConditionUrl;
  final String? userName;

  SignUpScreen(
      {this.socialLogin = false,
      this.userName,
      this.isOtp = false,
      this.countryCode,
      this.privacyPolicyUrl,
      this.termsConditionUrl});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  AuthServices authService = AuthServices();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carProductionController = TextEditingController();
  TextEditingController carPlateController = TextEditingController();
  TextEditingController carColorController = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode userNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  bool mIsCheck = false;
  bool isAcceptedTc = false;
  String countryCode = defaultCountryCode;

  int currentIndex = 0;

  List<ServiceList> listServices = [];

  int selectedService = 0;

  XFile? imageProfile;
  int radioValue = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (sharedPref.getString(PLAYER_ID).validate().isEmpty) {
      await saveOneSignalPlayerId().then((value) {
        //
      });
    }
    await getServices().then((value) {
      listServices.addAll(value.data!);
      print('checkbhaya $listServices');
      setState(() {});
    }).catchError((error) {
      log(error.toString());
    });
  }

  // Future<void> register() async {
  //   hideKeyboard(context);
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();
  //     if (isAcceptedTc) {
  //       appStore.setLoading(true);
  //       Map req = {
  //         'first_name': firstController.text.trim(),
  //         'last_name': lastNameController.text.trim(),
  //         'username': widget.socialLogin
  //             ? widget.userName
  //             : userNameController.text.trim(),
  //         'email': emailController.text.trim(),
  //         "user_type": "driver",
  //         "contact_number": widget.socialLogin
  //             ? '${widget.countryCode}${widget.userName}'
  //             : '$countryCode${phoneController.text.trim()}',
  //         'password':
  //             widget.socialLogin ? widget.userName : passController.text.trim(),
  //         "player_id": sharedPref.getString(PLAYER_ID).validate(),
  //         if (widget.socialLogin) 'login_type': LoginTypeOTP,
  //         "user_detail": {
  //           'car_model': carModelController.text.trim(),
  //           'car_color': carColorController.text.trim(),
  //           'car_plate_number': carPlateController.text.trim(),
  //           'car_production_year': carProductionController.text.trim(),
  //         },
  //         'service_id': listServices[selectedService].id,
  //       };
  //       print('dataz $req');
  //       await signUpApi(req).then((value) {
  //         authService
  //             .signUpWithEmailPassword(context,
  //                 mobileNumber: widget.socialLogin
  //                     ? '${widget.countryCode}${widget.userName}'
  //                     : '$countryCode${phoneController.text.trim()}',
  //                 email: emailController.text.trim(),
  //                 fName: firstController.text.trim(),
  //                 lName: lastNameController.text.trim(),
  //                 userName: widget.socialLogin
  //                     ? widget.userName
  //                     : userNameController.text.trim(),
  //                 password: widget.socialLogin
  //                     ? widget.userName
  //                     : passController.text.trim(),
  //                 userType: DRIVER,
  //                 isOtpLogin: widget.socialLogin)
  //             .then((res) async {
  //           //
  //         }).catchError((e) {
  //           appStore.setLoading(false);
  //           toast('$e');
  //         });
  //       }).catchError((error) {
  //         appStore.setLoading(false);
  //         toast('${error['message']}');
  //       });
  //     } else {
  //       toast(language.pleaseAcceptTermsOfServicePrivacyPolicy);
  //     }
  //   }
  // }
  Future<void> register() async {
    // Hide the keyboard if it's open
    FocusScope.of(context).unfocus();
    launchScreen(context, BottomScreen(),
        isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);

    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();

    //   if (isAcceptedTc) {
    //     // Show the loading message to simulate a network request
    //     showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           content: Row(
    //             children: [
    //               CircularProgressIndicator(),
    //               SizedBox(width: 20),
    //               Text("Submitting..."),
    //             ],
    //           ),
    //         );
    //       },
    //     );

    //     try {
    //       Map req = {
    //         'first_name': firstController.text.trim(),
    //         'last_name': lastNameController.text.trim(),
    //         'email': emailController.text.trim(),
    //         'contact_number': phoneController.text.trim(),
    //         'password': passController.text.trim(),
    //         'car_model': carModelController.text.trim(),
    //         'car_color': carColorController.text.trim(),
    //         'car_plate_number': carPlateController.text.trim(),
    //         'car_production_year': carProductionController.text.trim(),
    //         'service_id': selectedDriver, // Store selected driver here
    //       };

    //       print('Data to submit: $req');

    //       // Simulate the signup API request
    //       await Future.delayed(Duration(seconds: 2), () {
    //         Navigator.pop(context); // Close the loading dialog
    //         Fluttertoast.showToast(msg: "Registration successful!");
    //         // Navigate to the next screen or show success message
    //       });
    //     } catch (e) {
    //       Navigator.pop(context); // Close the loading dialog
    //       Fluttertoast.showToast(msg: "Error: $e");
    //     }
    //   } else {
    //     Navigator.pop(context); // Close the loading dialog
    //     Fluttertoast.showToast(msg: "Please accept the terms and conditions.");
    //   }
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List<String> production_type = ['SUV', 'Car'];
  String? selectedYear;

  int currentStep = 1;

  // Controllers for each step
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();

  // Function to handle next step
  void nextStep() {
    setState(() {
      currentStep++;
    });
  }

  // Function to handle previous step
  void previousStep() {
    setState(() {
      currentStep--;
    });
  }

  void submit() {
    // Submit logic goes here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signup Complete")),
    );
  }

  final List<Map<String, String>> drivers = [
    {"image": "images/driver1.png", "name": "Chauffeur Services"},
    {"image": "images/driver2.png", "name": "In City Services"},
  ];
  String? selectedDriver; // To store the selected driver's value

  XFile? driverLicense;
  XFile? vehicleRegistration;
  XFile? cnicFront;
  XFile? cnicBack;
  XFile? userImage;
  // ignore: unused_field
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from camera or gallery
  Future<void> _pickImage(String type) async {
    final pickedFile = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context,
                    await _picker.pickImage(source: ImageSource.camera));
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context,
                    await _picker.pickImage(source: ImageSource.gallery));
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );

    // Save the picked file to the respective variable
    if (pickedFile != null) {
      setState(() {
        switch (type) {
          case 'driverLicense':
            driverLicense = pickedFile;
            break;
          case 'vehicleRegistration':
            vehicleRegistration = pickedFile;
            break;
          case 'cnicFront':
            cnicFront = pickedFile;
            break;
          case 'cnicBack':
            cnicBack = pickedFile;
            break;
          case 'userImage':
            userImage = pickedFile;
            break;
        }
      });
    }
  }

  Widget _buildImagePickerButton(String label, String type, XFile? imageFile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "ProximaNova",
            ),
          ),
        ),
        // Upload Button with Custom Design
        GestureDetector(
            onTap: () => _pickImage(type),
            child: DottedBorder(
              color: Color(0xffC9C9C9),
              strokeWidth: 2.5,
              dashPattern: [15, 4],
              borderType: BorderType.RRect,
              radius: Radius.circular(14.5),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.white,
                  ),
                  child: imageFile != null
                      ? Image.file(
                          File(imageFile.path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/download.png')),
                            SizedBox(width: 8),
                            Text(
                              "Click to upload",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff716C6C),
                              ),
                            )
                          ],
                        )),
            )),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      // color: Colors.white.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (currentStep == 1)
                              Center(
                                child: Text(
                                  "Driver Registration",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily:
                                        GoogleFonts.redHatDisplay().fontFamily,
                                  ),
                                ),
                              ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                currentStep == 1
                                    ? "Personal Information"
                                    : currentStep == 2
                                        ? "Service Details"
                                        : currentStep == 3
                                            ? "Vehicle Information"
                                            : "Document Upload",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily:
                                      GoogleFonts.redHatDisplay().fontFamily,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            // Step 1: Personal Details
                            if (currentStep == 1) ...[
                              InputField(
                                label: "Full Name",
                                controller: nameController,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Full Name';
                                  }
                                  return null;
                                },
                              ),
                              InputField(
                                label: "Email",
                                controller: emailController,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              InputField(
                                label: "Phone Number",
                                controller: phoneController,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Phone Number';
                                  }
                                  return null;
                                },
                              ),
                              InputField(
                                label: "Password",
                                controller: passController,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Passowrd';
                                  }
                                  return null;
                                },
                              ),
                            ] else if (currentStep == 2) ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: drivers.map((driver) {
                                  bool isSelected =
                                      selectedDriver == driver['name'];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedDriver = driver['name'];
                                      });
                                    },
                                    child: Card(
                                      elevation: isSelected ? 8 : 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width: 150,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.grey,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              driver['image']!,
                                              width: 100,
                                              height: 100,
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              driver['name']!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ]
                            // Step 2: Vehicle Details
                            else if (currentStep == 3) ...[
                              SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  "Vehicle Type",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "ProximaNova",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: DropdownButtonFormField<String>(
                                  value: selectedYear,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                  iconSize: 0,
                                  items: production_type.map((String year) {
                                    return DropdownMenuItem<String>(
                                      value: year,
                                      child: Text(year),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedYear = value;
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
                              InputField(
                                controller: carProductionController,
                                label: "Vehicle Model",
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Production Year';
                                  }
                                  return null;
                                },
                              ),
                              InputField(
                                controller: carPlateController,
                                label: "License Plate",
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Vehicle Plate Number';
                                  }
                                  return null;
                                },
                              ),
                              InputField(
                                controller: carColorController,
                                label: "Vehicle Color",
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Vehicle Vehicle Color';
                                  }
                                  return null;
                                },
                              ),
                            ]

                            // Step 3: Review & Submit
                            else if (currentStep == 4) ...[
                              _buildImagePickerButton("Driver's License",
                                  'driverLicense', driverLicense),
                              _buildImagePickerButton("Vehicle Registration",
                                  'vehicleRegistration', vehicleRegistration),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Next or Submit Button
            SubmissionButton(
              text: currentStep == 4 ? "Register" : "Next",
              onPressed: currentStep == 4 ? register : nextStep,
            )
          ],
        ),
      ),
    );
  }
}
