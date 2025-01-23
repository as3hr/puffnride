import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oncab/screens/DashboardScreen.dart';
import 'package:oncab/utils/Constants.dart';
import 'package:oncab/utils/Extensions/StringExtensions.dart';
import 'package:oncab/utils/Extensions/context_extensions.dart';
import 'package:oncab/utils/Images.dart';
import 'package:oncab/screens/BottomScreen.dart';

import '../../main.dart';
import '../Services/AuthService.dart';
import '../model/UserDetailModel.dart';
import '../network/RestApis.dart';
import '../utils/Colors.dart';
import '../utils/Common.dart';
import '../utils/Extensions/app_common.dart';
import 'SignUpScreen.dart';
import 'DocumentsScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserData _userModel;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthServices authService = AuthServices();
  GoogleAuthServices googleAuthService = GoogleAuthServices();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  bool mIsCheck = false;
  bool isAcceptedTc = false;
  String? privacyPolicy;
  String countryCode = defaultCountryCode;

  String? termsCondition;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    appSetting();
    if (sharedPref.getString(PLAYER_ID).validate().isEmpty) {
      await saveOneSignalPlayerId().then((value) {
        //
      });
    }
    mIsCheck = sharedPref.getBool(REMEMBER_ME) ?? false;
    if (mIsCheck) {
      emailController.text = sharedPref.getString(CONTACT_NUMBER).validate();
      passController.text = sharedPref.getString(USER_PASSWORD).validate();
    }
  }

  Future<void> logIn() async {
    print('puffnride');

    hideKeyboard(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child:
                CircularProgressIndicator()); // You can use any widget you want here
      },
    );
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setLoading(true);

      Map req = {
        'contact_number': '${emailController.text.trim()}',
        'password': passController.text.trim(),
        "player_id": sharedPref.getString(PLAYER_ID).validate(),
        'user_type': DRIVER,
      };
      print('$req kamal');
      // await sharedPref.setBool(REMEMBER_ME, mIsCheck);

      if (mIsCheck) {
        await sharedPref.setString(USER_EMAIL, emailController.text);
        await sharedPref.setString(USER_PASSWORD, passController.text);
      }
      await logInApi(req).then((value) async {
        _userModel = value.data!;
        await _auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then((value) async {
          sharedPref.setString(UID, value.user!.uid);
          updateProfileUid();
          if (sharedPref.getInt(IS_Verified_Driver) == 1) {
            await checkPermission().then((value) async {
              await Geolocator.getCurrentPosition().then((value) {
                sharedPref.setDouble(LATITUDE, value.latitude);
                sharedPref.setDouble(LONGITUDE, value.longitude);
              });
            });
            launchScreen(context, BottomScreen(),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          } else {
            launchScreen(context, DocumentsScreen(isShow: true),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          }
          appStore.isLoading = false;
        }).catchError((e) async {
          if (e.toString().contains('user-not-found')) {
            authService.signUpWithEmailPassword(
              context,
              mobileNumber: _userModel.contactNumber,
              email: emailController.text,
              fName: _userModel.firstName,
              lName: _userModel.lastName,
              userName: _userModel.username,
              password: passController.text,
              userType: DRIVER,
            );
          } else {
            if (sharedPref.getInt(IS_Verified_Driver) == 1) {
              await checkPermission().then((value) async {
                await Geolocator.getCurrentPosition().then((value) {
                  sharedPref.setDouble(LATITUDE, value.latitude);
                  sharedPref.setDouble(LONGITUDE, value.longitude);
                });
              });
              launchScreen(context, BottomScreen(),
                  isNewTask: true,
                  pageRouteAnimation: PageRouteAnimation.Slide);
            } else {
              launchScreen(context, DocumentsScreen(isShow: true),
                  isNewTask: true,
                  pageRouteAnimation: PageRouteAnimation.Slide);
            }
          }
          log('${e.toString()}');
          log(e.toString());
        });
      }).catchError((error) {
        appStore.setLoading(false);

        toast(error.toString());
        log('${error.toString()}');
      });
    }
  }

  Future<void> appSetting() async {
    await getAppSettingApi().then((value) {
      if (value.privacyPolicyModel!.value != null)
        privacyPolicy = value.privacyPolicyModel!.value;
      if (value.termsCondition!.value != null)
        termsCondition = value.termsCondition!.value;
    }).catchError((error) {
      log(error.toString());
    });
  }

  void googleSignIn() async {
    hideKeyboard(context);
    appStore.setLoading(true);

    await googleAuthService.signInWithGoogle(context).then((value) async {
      appStore.setLoading(false);
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString());
      print(e.toString());
    });
  }

  appleLoginApi() async {
    hideKeyboard(context);
    appStore.setLoading(true);
    await appleLogIn().then((value) {
      appStore.setLoading(false);
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'), // Path to your image
            fit: BoxFit.cover, // Adjust the image fit
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App logo

                // Login form card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      image: DecorationImage(
                        image:
                            AssetImage('images/bg.jpg'), // Path to your image
                        fit: BoxFit.cover, // Adjust the image fit
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Text(
                              "Driver Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                                height: 16), // Space between heading and input

                            // Email input field
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFA0A0A0)), // border: 1px solid #A0A0A0
                                ),
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),

                            // Password input field
                            TextFormField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFA0A0A0)), // border: 1px solid #A0A0A0
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),

                            // Login button with gradient
                            SizedBox(
                              height:
                                  53, // Set the height of the button to 53px
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets
                                      .zero, // Ensure no additional padding to maintain alignment
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        45), // border-radius: 45px
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors
                                      .transparent, // Transparent background for gradient
                                ),
                                onPressed: logIn,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF192B85), // #192B85
                                        Color(0xFF9D48CE), // #9D48CE
                                      ],
                                      transform: GradientRotation(-8.21),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        45), // border-radius: 45px
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints
                                        .expand(), // Ensures the container fills the button
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        color: Colors.white, // White text color
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            // Forgot password without margin top
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  // Handle forgot password
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: "Register",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        hideKeyboard(context);
                                        launchScreen(
                                          context,
                                          SignUpScreen(
                                            privacyPolicyUrl: privacyPolicy,
                                            termsConditionUrl: termsCondition,
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget socialWidget() {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.all(16),
  //         child: Row(
  //           children: [
  //             Expanded(child: Divider(color: dividerColor)),
  //             Padding(
  //               padding: EdgeInsets.only(left: 16, right: 16),
  //               child: Text(language.orLogInWith, style: primaryTextStyle()),
  //             ),
  //             Expanded(
  //               child: Divider(color: dividerColor),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(height: 16),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           inkWellWidget(
  //               onTap: () async {
  //                 googleSignIn();
  //               },
  //               child: socialWidgetComponent(img: ic_google)),
  //           SizedBox(width: 12),
  //           inkWellWidget(
  //             onTap: () async {
  //               showDialog(
  //                 context: context,
  //                 builder: (_) {
  //                   return AlertDialog(
  //                     contentPadding: EdgeInsets.all(16),
  //                     content: OTPDialog(),
  //                   );
  //                 },
  //               );
  //               appStore.setLoading(false);
  //             },
  //             child: Container(
  //               padding: EdgeInsets.all(6),
  //               decoration: BoxDecoration(
  //                   border: Border.all(color: dividerColor),
  //                   borderRadius: radius(defaultRadius)),
  //               child: Image.asset(ic_mobile_White,
  //                   fit: BoxFit.cover, height: 30, width: 30),
  //             ),
  //           ),
  //           if (Platform.isIOS) SizedBox(width: 12),
  //           if (Platform.isIOS)
  //             inkWellWidget(
  //               onTap: () async {
  //                 appleLoginApi();
  //               },
  //               child: Padding(
  //                   padding: EdgeInsets.only(bottom: 4.0),
  //                   child: socialWidgetComponent(img: ic_apple)),
  //             ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget socialWidgetComponent({required String img, bool? isMobile = false}) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: dividerColor),
          borderRadius: radius(defaultRadius)),
      child: Image.asset(img, fit: BoxFit.cover, height: 30, width: 30),
    );
  }
}
