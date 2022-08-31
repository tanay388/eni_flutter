import 'dart:async';
import 'dart:io';
import 'package:employee_management/EmployDashboard.dart';
import 'package:flutter/material.dart';
import 'OnBoarding.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'avenir'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () => openOnBoard());

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('asset/image/logo_eni.png'),
          )),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const EmployDashboard(empId: '62f4a7f04ae0b22db511fdad')));
  }
}
