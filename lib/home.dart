import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hope_for_humaninty/Models/signup_details.dart';
import 'package:hope_for_humaninty/dashboard_page.dart';
import 'package:hope_for_humaninty/home_page.dart';
import 'package:hope_for_humaninty/login_page.dart';
import 'package:hope_for_humaninty/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class ForSignupScreen {
  ForSignupScreen({
    required this.switchToLoginScreen,
    required this.addNewSignupDetail,
    required this.saveIntosp,
    required this.signupDetails,
  });

  final void Function(BuildContext context) switchToLoginScreen;
  final void Function(SignupDetails) addNewSignupDetail;
  final void Function() saveIntosp;
  final List<SignupDetails> signupDetails;
}

class ForHomeScreen {
  ForHomeScreen({
    required this.switchToLoginScreen,
    required this.switchToSignupScreen,
  });

  final void Function(BuildContext)? switchToLoginScreen;
  final void Function(BuildContext)? switchToSignupScreen;
}

class ForLoginScreen {
  ForLoginScreen({
    required this.switchToSignupPage,
    required this.switchToDashboardScreen,
    required this.signupDetails,
    required this.upadateSignupDetail,
    required this.saveIntosp,
  });

  final void Function(BuildContext context) switchToSignupPage;
  final void Function(
    BuildContext context,
    SignupDetails signupDetails,
    int index,
  ) switchToDashboardScreen;
  final List<SignupDetails> signupDetails;
  final void Function(int, String) upadateSignupDetail;
  final void Function() saveIntosp;
}

class ForDashBoardScreen {
  const ForDashBoardScreen({
    required this.userName,
    required this.signupDetails,
    required this.index,
    required this.saveIntosp,
  });

  final String userName;
  final void Function() saveIntosp;
  final List<SignupDetails> signupDetails;
  final int index;
}

class _HomeState extends State<Home> {
  late SharedPreferences sp;
  List<SignupDetails> signupDetails = [];

  void getSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    readFromsp();
  }

  @override
  void initState() {
    getSharedPreferences();
    super.initState(); //
  }

  void saveIntosp() {
    List<String> signupDetailsString = signupDetails
        .map((signupDetail) => jsonEncode(signupDetail.toJson()))
        .toList();
    sp.setStringList("key", signupDetailsString);
  }

  void readFromsp() {
    List<String>? signupDetailsString = sp.getStringList("key");
    if (signupDetailsString != null) {
      signupDetails = signupDetailsString
          .map((signupDetail) =>
              SignupDetails.fromJson(json.decode(signupDetail)))
          .toList();
    }
    setState(() {});
  }

  void addNewSignupDetail(SignupDetails signupDetail) {
    signupDetails.add(signupDetail);
  }

  void upadateSignupDetail(int index, String password) {
    signupDetails[index].password = password;
  }

  void atHomeSwitchtoLogin(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/login_page',
      arguments: ForLoginScreen(
        switchToSignupPage: switchToSignupScreen,
        switchToDashboardScreen: switchToDashboardScreen,
        upadateSignupDetail: upadateSignupDetail,
        signupDetails: signupDetails,
        saveIntosp: saveIntosp,
      ),
    );
  }

  void atHomeSwitchtoSignup(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/signup_page',
      arguments: ForSignupScreen(
        switchToLoginScreen: switchToLoginScreen,
        addNewSignupDetail: addNewSignupDetail,
        saveIntosp: saveIntosp,
        signupDetails: signupDetails,
      ),
    );
  }

  void switchToLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      '/login_page',
      arguments: ForLoginScreen(
        switchToSignupPage: switchToSignupScreen,
        switchToDashboardScreen: switchToDashboardScreen,
        upadateSignupDetail: upadateSignupDetail,
        signupDetails: signupDetails,
        saveIntosp: saveIntosp,
      ),
    );
  }

  String userName = '';
  void switchToDashboardScreen(
      BuildContext context, SignupDetails name, int index) {
    Navigator.of(context).pushReplacementNamed(
      '/dashboard_page',
      arguments: ForDashBoardScreen(
        userName: name.name,
        signupDetails: signupDetails,
        index: index,
        saveIntosp: saveIntosp,
      ),
    );
  }

  void switchToSignupScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      '/signup_page',
      arguments: ForSignupScreen(
        switchToLoginScreen: switchToLoginScreen,
        addNewSignupDetail: addNewSignupDetail,
        saveIntosp: saveIntosp,
        signupDetails: signupDetails,
      ),
    );
  }

  // void switchToHomeScreen(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed(
  //     '/home_screen',
  //     arguments: ForHomeScreen(
  //       switchToLoginScreen: switchToLoginScreen,
  //       switchToSignupScreen: switchToSignupScreen,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_page',
      routes: {
        '/home_page': (context) => HomePage(
              switchToLoginScreen: atHomeSwitchtoLogin,
              switchToSignupScreen: atHomeSwitchtoSignup,
            ),
        '/login_page': (context) => const LoginPage(),
        '/signup_page': (context) => const SignupPage(),
        '/dashboard_page': (context) => const DashboardPage(),
      },
    );
  }
}
