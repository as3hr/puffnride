import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oncab/Services/AuthService.dart';
import 'package:oncab/main.dart';
import 'package:oncab/utils/Extensions/StringExtensions.dart';
import 'package:oncab/utils/Extensions/context_extensions.dart';
import '../model/ServiceModel.dart';
import '../network/RestApis.dart';
import '../utils/Common.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/app_common.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

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

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (isAcceptedTc) {
        // Show the loading message to simulate a network request
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Submitting..."),
                ],
              ),
            );
          },
        );

        try {
          Map req = {
            'first_name': firstController.text.trim(),
            'last_name': lastNameController.text.trim(),
            'email': emailController.text.trim(),
            'contact_number': phoneController.text.trim(),
            'password': passController.text.trim(),
            'car_model': carModelController.text.trim(),
            'car_color': carColorController.text.trim(),
            'car_plate_number': carPlateController.text.trim(),
            'car_production_year': carProductionController.text.trim(),
            'service_id': selectedDriver, // Store selected driver here
          };

          print('Data to submit: $req');

          // Simulate the signup API request
          await Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context); // Close the loading dialog
            Fluttertoast.showToast(msg: "Registration successful!");
            // Navigate to the next screen or show success message
          });
        } catch (e) {
          Navigator.pop(context); // Close the loading dialog
          Fluttertoast.showToast(msg: "Error: $e");
        }
      } else {
        Navigator.pop(context); // Close the loading dialog
        Fluttertoast.showToast(msg: "Please accept the terms and conditions.");
      }
    }
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
    {"image": "images/driver1.svg", "name": "Chauffeur Services"},
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
        // Upload Button with Custom Design
        GestureDetector(
          onTap: () => _pickImage(type),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.5),
              border: Border.all(
                  color: Color(0xFFD1CFCF), width: 3, style: BorderStyle.solid),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                imageFile == null ? label : 'Image Selected',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        // Display the selected image if available
        if (imageFile != null)
          Image.file(
            File(imageFile.path),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
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
                            Text(
                              currentStep == 1
                                  ? "Driver Registration"
                                  : currentStep == 2
                                      ? "Service Details"
                                      : currentStep == 3
                                          ? "Vehicles Details"
                                          : "Document Upload",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Step 1: Personal Details
                            if (currentStep == 1) ...[
                              TextFormField(
                                controller: firstController,
                                decoration: InputDecoration(
                                  labelText: "Full Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Full Name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.email),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Phone Number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: passController,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Password';
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
                              DropdownButtonFormField<String>(
                                value: selectedYear,
                                decoration: InputDecoration(
                                  labelText: "Vehicle Production Year",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.verified),
                                ),
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
                                    return 'Please select the production Year';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: carProductionController,
                                decoration: InputDecoration(
                                  labelText: "Vehicle Production Year",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.verified),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Production Year';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: carModelController,
                                decoration: InputDecoration(
                                  labelText: "Vehicle Model",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.verified),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Model';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: carPlateController,
                                decoration: InputDecoration(
                                  labelText: "Vehicle Plate Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.verified),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Vehicle Plate Number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: carColorController,
                                decoration: InputDecoration(
                                  labelText: "Vehicle Color",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.verified),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Vehicle Color';
                                  }
                                  return null;
                                },
                              ),
                            ]

                            // Step 3: Review & Submit
                            else if (currentStep == 4) ...[
                              _buildImagePickerButton("Upload Driver's License",
                                  'driverLicense', driverLicense),
                              // Vehicle Registration Upload
                              _buildImagePickerButton(
                                  "Upload Vehicle Registration",
                                  'vehicleRegistration',
                                  vehicleRegistration),
                              // CNIC Front Upload
                              _buildImagePickerButton(
                                  "Upload CNIC Front", 'cnicFront', cnicFront),
                              // CNIC Back Upload
                              _buildImagePickerButton(
                                  "Upload CNIC Back", 'cnicBack', cnicBack),
                              // User Image Upload
                              _buildImagePickerButton(
                                  "Upload Your Image", 'userImage', userImage),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 53,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: currentStep == 4 ? register : nextStep,
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF192B85), // #192B85
                          Color(0xFF9D48CE), // #9D48CE
                        ],
                      ),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints.expand(),
                      child: Text(
                        currentStep == 4 ? "register" : "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       elevation: 0,
  //       backgroundColor: Colors.transparent,
  //       leading: BackButton(color: context.iconColor),
  //       title: Text(language.signUp, style: boldTextStyle()),
  //     ),
  //     body: Stack(
  //       children: [
  //         Form(
  //           key: formKey,
  //           child: Stepper(
  //             currentStep: currentIndex,
  //             onStepCancel: () {
  //               if (currentIndex > 0) {
  //                 currentIndex--;
  //                 setState(() {});
  //               }
  //             },
  //             onStepContinue: () {
  //               if (formKeys[currentIndex].currentState!.validate()) {
  //                 if (currentIndex == 1 && listServices.isEmpty) {
  //                   return toast(language.pleaseSelectService);
  //                 } else if (currentIndex <= 4) {
  //                   currentIndex++;
  //                   setState(() {});
  //                 } else {
  //                   register();
  //                 }
  //               }
  //             },
  //             onStepTapped: (int index) {
  //               currentIndex = index;
  //               setState(() {});
  //             },
  //             steps: [
  //               Step(
  //                 isActive: currentIndex <= 0,
  //                 state: currentIndex <= 0
  //                     ? StepState.disabled
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   connectorColor: Colors.amber,
  //                   color: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title: Text(language.userDetail, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[0],
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: AppTextField(
  //                               textFieldType: TextFieldType.NAME,
  //                               controller: firstController,
  //                               focus: firstNameFocus,
  //                               nextFocus: lastNameFocus,
  //                               errorThisFieldRequired:
  //                                   language.thisFieldRequired,
  //                               decoration: inputDecoration(context,
  //                                   label: language.firstName),
  //                             ),
  //                           ),
  //                           SizedBox(width: 16),
  //                           Expanded(
  //                             child: AppTextField(
  //                               textFieldType: TextFieldType.NAME,
  //                               controller: lastNameController,
  //                               focus: lastNameFocus,
  //                               nextFocus: emailFocus,
  //                               errorThisFieldRequired:
  //                                   language.thisFieldRequired,
  //                               decoration: inputDecoration(context,
  //                                   label: language.lastName),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 8),
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: AppTextField(
  //                               textFieldType: TextFieldType.EMAIL,
  //                               focus: emailFocus,
  //                               controller: emailController,
  //                               nextFocus: userNameFocus,
  //                               errorThisFieldRequired:
  //                                   language.thisFieldRequired,
  //                               decoration: inputDecoration(context,
  //                                   label: language.email),
  //                             ),
  //                           ),
  //                           SizedBox(width: 16),
  //                           if (widget.socialLogin != true)
  //                             Expanded(
  //                               child: AppTextField(
  //                                 textFieldType: TextFieldType.USERNAME,
  //                                 focus: userNameFocus,
  //                                 controller: userNameController,
  //                                 nextFocus: phoneFocus,
  //                                 errorThisFieldRequired:
  //                                     language.thisFieldRequired,
  //                                 decoration: inputDecoration(context,
  //                                     label: language.userName),
  //                               ),
  //                             ),
  //                         ],
  //                       ),
  //                       if (widget.socialLogin != true) SizedBox(height: 8),
  //                       if (widget.socialLogin != true)
  //                         AppTextField(
  //                           controller: phoneController,
  //                           textFieldType: TextFieldType.PHONE,
  //                           focus: phoneFocus,
  //                           nextFocus: passFocus,
  //                           decoration: inputDecoration(
  //                             context,
  //                             label: language.phoneNumber,
  //                             prefixIcon: IntrinsicHeight(
  //                               child: Row(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 children: [
  //                                   CountryCodePicker(
  //                                     padding: EdgeInsets.zero,
  //                                     initialSelection: countryCode,
  //                                     showCountryOnly: false,
  //                                     dialogSize: Size(
  //                                         MediaQuery.of(context).size.width -
  //                                             60,
  //                                         MediaQuery.of(context).size.height *
  //                                             0.6),
  //                                     showFlag: true,
  //                                     showFlagDialog: true,
  //                                     showOnlyCountryWhenClosed: false,
  //                                     alignLeft: false,
  //                                     textStyle: primaryTextStyle(),
  //                                     dialogBackgroundColor:
  //                                         Theme.of(context).cardColor,
  //                                     barrierColor: Colors.black12,
  //                                     dialogTextStyle: primaryTextStyle(),
  //                                     searchDecoration: InputDecoration(
  //                                       iconColor:
  //                                           Theme.of(context).dividerColor,
  //                                       enabledBorder: UnderlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Theme.of(context)
  //                                                   .dividerColor)),
  //                                       focusedBorder: UnderlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: primaryColor)),
  //                                     ),
  //                                     searchStyle: primaryTextStyle(),
  //                                     onInit: (c) {
  //                                       countryCode = c!.dialCode!;
  //                                     },
  //                                     onChanged: (c) {
  //                                       countryCode = c.dialCode!;
  //                                     },
  //                                   ),
  //                                   VerticalDivider(
  //                                       color: Colors.grey.withOpacity(0.5)),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           validator: (value) {
  //                             if (value!.trim().isEmpty)
  //                               return language.thisFieldRequired;
  //                             return null;
  //                           },
  //                         ),
  //                       if (widget.socialLogin != true) SizedBox(height: 8),
  //                       if (widget.socialLogin != true)
  //                         AppTextField(
  //                           controller: passController,
  //                           focus: passFocus,
  //                           autoFocus: false,
  //                           textFieldType: TextFieldType.PASSWORD,
  //                           errorThisFieldRequired: language.thisFieldRequired,
  //                           decoration: inputDecoration(context,
  //                               label: language.password),
  //                         ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Step(
  //                 isActive: currentIndex <= 1,
  //                 state: currentIndex <= 1
  //                     ? StepState.disabled
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   color: Colors.amber,
  //                   connectorColor: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title: Text(language.selectService, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[1],
  //                   child: listServices.isNotEmpty
  //                       ? Column(
  //                           children: listServices.map((e) {
  //                             return inkWellWidget(
  //                               onTap: () {
  //                                 selectedService = listServices.indexOf(e);
  //                                 setState(() {});
  //                               },
  //                               child: Container(
  //                                 margin: EdgeInsets.only(bottom: 8),
  //                                 padding: EdgeInsets.only(
  //                                     left: 16, right: 8, top: 4, bottom: 4),
  //                                 decoration: BoxDecoration(
  //                                   border: Border.all(
  //                                       color: selectedService ==
  //                                               listServices.indexOf(e)
  //                                           ? Colors.green
  //                                           : primaryColor.withOpacity(0.5)),
  //                                   borderRadius:
  //                                       BorderRadius.circular(defaultRadius),
  //                                 ),
  //                                 child: Row(
  //                                   children: [
  //                                     commonCachedNetworkImage(e.serviceImage,
  //                                         fit: BoxFit.contain,
  //                                         height: 50,
  //                                         width: 50),
  //                                     SizedBox(width: 16),
  //                                     Expanded(
  //                                       child: Text(e.name.validate(),
  //                                           style: boldTextStyle()),
  //                                     ),
  //                                     Visibility(
  //                                       visible: selectedService ==
  //                                           listServices.indexOf(e),
  //                                       child: Icon(Icons.check_circle_outline,
  //                                           color: Colors.green),
  //                                     )
  //                                   ],
  //                                 ),
  //                               ),
  //                             );
  //                           }).toList(),
  //                         )
  //                       : emptyWidget(),
  //                 ),
  //               ),
  //               Step(
  //                 isActive: currentIndex <= 2,
  //                 state: currentIndex <= 2
  //                     ? StepState.disabled
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   color: Colors.amber,
  //                   connectorColor: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title: Text(language.carModel, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[2],
  //                   child: AppTextField(
  //                       textFieldType: TextFieldType.NAME,
  //                       controller: carModelController,
  //                       decoration:
  //                           inputDecoration(context, label: language.carModel)),
  //                 ),
  //               ),
  //               Step(
  //                 isActive: currentIndex <= 3,
  //                 state: currentIndex <= 3
  //                     ? StepState.indexed
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   color: Colors.amber,
  //                   connectorColor: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title:
  //                     Text(language.carProductionYear, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[3],
  //                   child: AppTextField(
  //                       textFieldType: TextFieldType.PHONE,
  //                       controller: carProductionController,
  //                       decoration: inputDecoration(context,
  //                           label: language.carProductionYear)),
  //                 ),
  //               ),
  //               Step(
  //                 isActive: currentIndex <= 4,
  //                 state: currentIndex <= 4
  //                     ? StepState.disabled
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   color: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title: Text(language.carPlateNumber, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[4],
  //                   child: AppTextField(
  //                       textFieldType: TextFieldType.NAME,
  //                       controller: carPlateController,
  //                       decoration: inputDecoration(context,
  //                           label: language.carPlateNumber)),
  //                 ),
  //               ),
  //               Step(
  //                 isActive: currentIndex <= 5,
  //                 state: currentIndex <= 5
  //                     ? StepState.disabled
  //                     : StepState.complete,
  //                 stepStyle: StepStyle(
  //                   color: Colors.amber,
  //                   connectorColor: Colors.amber,
  //                   indexStyle: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 title: Text(language.carColor, style: boldTextStyle()),
  //                 content: Form(
  //                   key: formKeys[5],
  //                   child: Column(
  //                     children: [
  //                       AppTextField(
  //                           textFieldType: TextFieldType.NAME,
  //                           controller: carColorController,
  //                           decoration: inputDecoration(context,
  //                               label: language.carColor)),
  //                       SizedBox(height: 8),
  //                       CheckboxListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         controlAffinity: ListTileControlAffinity.leading,
  //                         activeColor: primaryColor,
  //                         title: RichText(
  //                           text: TextSpan(children: [
  //                             TextSpan(
  //                                 text: '${language.agreeToThe} ',
  //                                 style: secondaryTextStyle()),
  //                             TextSpan(
  //                               text: language.termsConditions,
  //                               style: boldTextStyle(
  //                                   color: primaryColor, size: 14),
  //                               recognizer: TapGestureRecognizer()
  //                                 ..onTap = () {
  //                                   if (widget.termsConditionUrl != null &&
  //                                       widget.termsConditionUrl!.isNotEmpty) {
  //                                     launchScreen(
  //                                         context,
  //                                         TermsConditionScreen(
  //                                             title: language.termsConditions,
  //                                             subtitle:
  //                                                 widget.termsConditionUrl),
  //                                         pageRouteAnimation:
  //                                             PageRouteAnimation.Slide);
  //                                   } else {
  //                                     toast(language.txtURLEmpty);
  //                                   }
  //                                 },
  //                             ),
  //                             TextSpan(
  //                                 text: ' & ', style: secondaryTextStyle()),
  //                             TextSpan(
  //                               text: language.privacyPolicy,
  //                               style: boldTextStyle(
  //                                   color: primaryColor, size: 14),
  //                               recognizer: TapGestureRecognizer()
  //                                 ..onTap = () {
  //                                   if (widget.privacyPolicyUrl != null &&
  //                                       widget.privacyPolicyUrl!.isNotEmpty) {
  //                                     launchScreen(
  //                                         context,
  //                                         TermsConditionScreen(
  //                                             title: language.privacyPolicy,
  //                                             subtitle:
  //                                                 widget.privacyPolicyUrl),
  //                                         pageRouteAnimation:
  //                                             PageRouteAnimation.Slide);
  //                                   } else {
  //                                     toast(language.txtURLEmpty);
  //                                   }
  //                                 },
  //                             ),
  //                           ]),
  //                           textAlign: TextAlign.left,
  //                         ),
  //                         value: isAcceptedTc,
  //                         onChanged: (val) async {
  //                           isAcceptedTc = val!;
  //                           setState(() {});
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
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
