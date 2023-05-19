import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netteam/screens/Chat.dart';
import 'package:netteam/screens/ForgotPassword.dart';
import 'package:netteam/screens/Home.dart';
import 'package:netteam/screens/Interests.dart';
import 'package:netteam/screens/ResetPassword.dart';
import 'package:netteam/screens/Verify.dart';
import 'package:netteam/screens/VideoSet.dart';
import 'package:netteam/screens/login.dart';
import 'package:netteam/screens/signup.dart';
import 'package:netteam/screens/splashscreen.dart';
import 'package:netteam/screens/videoCall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NetTeam',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: "/splash",
          routes: {
            "/splash": (context) => const SplashScreen(),
            "/": (context) => const Home(),
            "/login" : (context) => const Login(),
            "/signup" : (context) => const SignUp(),
            "/forgotpassword" : (context) => const ForgotPassword(),
            "/verify" : (context) => const Verify(),
            "/resetpassword": (context) => const  ResetPassword(),
            "/interests" : (context) => const Interests(),
            "/videocall" : (context) => const VideoCall(),
            "/videoset" : (context) => const VideoSet(),
            "/chat": (context) => const Chat(),
          },
        );
      },
    );
  }
}

