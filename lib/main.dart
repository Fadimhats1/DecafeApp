import 'package:decafe_app/page/checkoutPage.dart';
import 'package:decafe_app/page/mainMenuPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const DecafeApp());
}

class DecafeApp extends StatefulWidget {
  const DecafeApp({Key? key}) : super(key: key);

  @override
  State<DecafeApp> createState() => _DecafeAppState();
}

class _DecafeAppState extends State<DecafeApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.fromRGBO(85, 206, 55, 1),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: WillPopScope(child: MainMenu(),
      onWillPop: () async => false,),
    );
  }
}
