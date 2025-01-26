import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:video_player/video_player.dart';
import 'package:oncab/screens/DashboardScreen.dart';
import 'package:oncab/screens/BottomScreen.dart';
import 'package:oncab/screens/SignInScreen.dart';
import 'package:oncab/utils/Extensions/StringExtensions.dart';
import '../main.dart';
import '../network/RestApis.dart';
import '../utils/Colors.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/app_common.dart';
import 'EditProfileScreen.dart';
import 'DocumentsScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    init();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset('images/splash_video.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play();
        _controller.setLooping(false);
        // Navigate to the next screen when the video completes
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _navigateToNextScreen();
          }
        });
      });
  }

  void init() async {
    await driverDetail();

    await Future.delayed(Duration(seconds: 2));

    if (sharedPref.getBool(IS_FIRST_TIME) ?? true) {
      await Geolocator.requestPermission().then((value) async {
        await Geolocator.getCurrentPosition().then((value) {
          sharedPref.setDouble(LATITUDE, value.latitude);
          sharedPref.setDouble(LONGITUDE, value.longitude);
          _navigateToWalkthroughScreen();
        });
      }).catchError((e) {
        _navigateToWalkthroughScreen();
      });
    } else {
      if (sharedPref.getString(CONTACT_NUMBER).validate().isEmptyOrNull &&
          appStore.isLoggedIn) {
        launchScreen(context, EditProfileScreen(isGoogle: true),
            isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
      } else if (sharedPref.getString(UID).validate().isEmptyOrNull &&
          appStore.isLoggedIn) {
        updateProfileUid().then((value) {
          if (sharedPref.getInt(IS_Verified_Driver) == 1) {
            launchScreen(context, BottomScreen(),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          } else {
            launchScreen(context, DocumentsScreen(isShow: true),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          }
        });
      } else if (sharedPref.getInt(IS_Verified_Driver) == 0 &&
          appStore.isLoggedIn) {
        launchScreen(context, DocumentsScreen(isShow: true),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      } else if (sharedPref.getInt(IS_Verified_Driver) == 1 &&
          appStore.isLoggedIn) {
        launchScreen(context, BottomScreen(),
            pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
            isNewTask: true);
      } else {
        launchScreen(context, SignInScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      }
    }
  }

  void _navigateToWalkthroughScreen() {
    launchScreen(context, SignInScreen(),
        pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
  }

  void _navigateToNextScreen() {
    if (sharedPref.getBool(IS_FIRST_TIME) ?? true) {
      _navigateToWalkthroughScreen();
    } else {
      if (sharedPref.getString(CONTACT_NUMBER).validate().isEmptyOrNull &&
          appStore.isLoggedIn) {
        launchScreen(context, EditProfileScreen(isGoogle: true),
            isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
      } else if (sharedPref.getString(UID).validate().isEmptyOrNull &&
          appStore.isLoggedIn) {
        updateProfileUid().then((value) {
          if (sharedPref.getInt(IS_Verified_Driver) == 1) {
            launchScreen(context, BottomScreen(),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          } else {
            launchScreen(context, DocumentsScreen(isShow: true),
                isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
          }
        });
      } else if (sharedPref.getInt(IS_Verified_Driver) == 0 &&
          appStore.isLoggedIn) {
        launchScreen(context, DocumentsScreen(isShow: true),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      } else if (sharedPref.getInt(IS_Verified_Driver) == 1 &&
          appStore.isLoggedIn) {
        launchScreen(context, BottomScreen(),
            pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
            isNewTask: true);
      } else {
        launchScreen(context, SignInScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      }
    }
  }

  Future<void> driverDetail() async {
    if (appStore.isLoggedIn) {
      await getUserDetail(userId: sharedPref.getInt(USER_ID))
          .then((value) async {
        await sharedPref.setInt(IS_ONLINE, value.data!.isOnline!);
        appStore.isAvailable = value.data!.isAvailable;
        if (value.data!.status == REJECT || value.data!.status == BANNED) {
          toast(
              '${language.yourAccountIs} ${value.data!.status}. ${language.pleaseContactSystemAdministrator}');
          logout();
        }
      }).catchError((error) {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: _navigateToNextScreen, // Navigate on tap
        child: Center(
          child: Stack(
            children: [
              // Video player as background
              Positioned.fill(
                child: _isVideoInitialized
                    ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Container(),
              ),
              // Removed logo and text section
            ],
          ),
        ),
      ),
    );
  }
}
