import 'package:flutter/material.dart';

class EmployDashboard extends StatefulWidget {
  final String? empId;
  const EmployDashboard({Key? key, required this.empId}) : super(key: key);

  @override
  State<EmployDashboard> createState() => _EmployDashboardState();
}

class _EmployDashboardState extends State<EmployDashboard> {
  String _empName = "Tanay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(top: 100, bottom: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.redAccent),
                child: Container(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome! " + _empName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your Dashboard to track your work. ${widget.empId}",
                        style: TextStyle(
                          color: Color.fromARGB(255, 254, 253, 253),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 215, 239, 253),
                        border:
                            Border.all(color: Color.fromARGB(255, 0, 19, 128))),
                    child: Column(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 60,
                          color: Color.fromARGB(255, 0, 19, 128),
                        ),
                        Text(
                          "Total Work this month:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "30.45 Hrs",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 19, 128),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 215, 239, 253),
                        border:
                            Border.all(color: Color.fromARGB(255, 0, 19, 128))),
                    child: Column(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 60,
                          color: Color.fromARGB(255, 0, 19, 128),
                        ),
                        Text(
                          "Total earning this month:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "\$ 3045",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 19, 128),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

