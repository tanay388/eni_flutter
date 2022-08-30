import 'dart:async';
import 'package:employee_management/EmployDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api_services.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String _timeString = "";
  String? _checkInMessage;
  String? _checkOutMessage;
  String? _empId;

  void checkinApiPost(String id) async {
    _checkInMessage = (await ApiService.postCheckIn(id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    showCheckInSuccessDialog(context, _checkInMessage);
  }

  void checkoutApiPost(String id) async {
    _checkOutMessage = (await ApiService.postCheckOut(id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    showCheckOutSuccessDialog(context, _checkOutMessage);
  }

  Future _qrScannerCheckIn() async {
    var cameraStatus = await Permission.camera.status;

    if (cameraStatus.isGranted) {
      String? qrData = await scanner.scan();
      _empId = qrData;
      if (qrData != null) checkinApiPost(qrData);
    } else {
      var isGrant = await Permission.camera.request();

      if (isGrant.isGranted) {
        String? qrData = await scanner.scan();
        _empId = qrData;
        if (qrData != null) checkinApiPost(qrData);
      }
    }
  }

  Future _qrScannerCheckOut() async {
    var cameraStatus = await Permission.camera.status;

    if (cameraStatus.isGranted) {
      String? qrData = await scanner.scan();
      _empId = qrData;
      if (qrData != null) checkoutApiPost(qrData);
    } else {
      var isGrant = await Permission.camera.request();

      if (isGrant.isGranted) {
        String? qrData = await scanner.scan();
        _empId = qrData;
        if (qrData != null) checkoutApiPost(qrData);
      }
    }
  }

  @override
  void initState() {
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second} {DateTime.now().}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/image/path2.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('asset/image/logo_eni.png'),
                      width: 120,
                    ),
                    Text(
                      "Welcome to the ENI Intelligent Solutions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your one stop Management and Tracking app for the work.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 400,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 9),
                          blurRadius: 20,
                          spreadRadius: 3)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's get to Work ✅",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 18, 57),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${_timeString}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 36, 217),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showCheckInDialog(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 115, 52),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 1, 89, 41)
                                          .withOpacity(0.2),
                                      offset: Offset(0, 9),
                                      blurRadius: 20,
                                      spreadRadius: 2)
                                ]),
                            child: Text(
                              "Check In",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            showCheckOutDialog(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 143, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 111, 17, 0)
                                          .withOpacity(0.2),
                                      offset: Offset(0, 9),
                                      blurRadius: 20,
                                      spreadRadius: 2)
                                ]),
                            child: Text(
                              "Check Out",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "QR code is needed to mark the attendence.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: 500,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                height: 190,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 192, 222, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 86, 168, 255)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 0, 166, 255)
                                                  .withOpacity(0.2),
                                          offset: Offset(0, 9),
                                          blurRadius: 20,
                                          spreadRadius: 2)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'asset/image/icon-dashboard.png'),
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "DashBoard",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 38, 88, 255)),
                                    ),
                                    Text(
                                      "View and manage all your statistics.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 57, 69, 74)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                height: 190,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 192, 222, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 86, 168, 255)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 0, 166, 255)
                                                  .withOpacity(0.2),
                                          offset: Offset(0, 2),
                                          blurRadius: 3,
                                          spreadRadius: 2)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'asset/image/icon-dashboard.png'),
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 38, 88, 255)),
                                    ),
                                    Text(
                                      "Facing problem? Reach Us.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 57, 69, 74)),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  void _getCurrentTime() {
    setState(() {
      _timeString = "${DateFormat('hh:mm:ss a').format(DateTime.now())}";
    });
  }

  showCheckInDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        _qrScannerCheckIn();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => EmployDashboard()));
        Navigator.of(context, rootNavigator: true).pop();
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.punch_clock_rounded,
            size: 70,
            color: Colors.greenAccent.shade700,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You will be Checked In to the office. Please keep your QR code ready to scan.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showCheckOutDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        _qrScannerCheckOut();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => EmployDashboard()));
        Navigator.of(context, rootNavigator: true).pop();
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.punch_clock_rounded,
            size: 70,
            color: Color.fromARGB(255, 255, 255, 6),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You will be Checked Out of the office. Please keep your QR code ready to scan.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showCheckInSuccessDialog(BuildContext context, String? Message) {
    // set up the buttons
    if (Message == null) {
      Message = "Failed";
    }
    Widget cancelButton = TextButton(
      child: Text("Done"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Dashboard"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployDashboard(
                      empId: _empId,
                    )));
        Navigator.of(context, rootNavigator: true).pop();
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.done_all_rounded,
            size: 70,
            color: Colors.greenAccent.shade700,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showCheckOutSuccessDialog(BuildContext context, String? Message) {
    // set up the buttons
    if (Message == null) {
      Message = "Failed";
    }
    Widget cancelButton = TextButton(
      child: Text("Done"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Dashboard"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployDashboard(
                      empId: _empId,
                    )));
        Navigator.of(context, rootNavigator: true).pop();
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.outbox_sharp,
            size: 70,
            color: Color.fromARGB(255, 255, 255, 6),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
