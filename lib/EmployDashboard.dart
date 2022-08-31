import 'package:employee_management/Models/DashboardResponse.dart';
import 'package:employee_management/api_services.dart';
import 'package:employee_management/widget.dart';
import 'package:flutter/material.dart';

class EmployDashboard extends StatefulWidget {
  final String? empId;
  const EmployDashboard({Key? key, required this.empId}) : super(key: key);

  @override
  State<EmployDashboard> createState() => _EmployDashboardState();
}

class _EmployDashboardState extends State<EmployDashboard> {
  late DashboardResponse dashboardData;
  String _empName = "Tanay";
  @override
  void initState() {
    // TODO: implement initState
    getDashBoardData();
    super.initState();
  }

  late List<Schedules> scheduleData = [];
  getDashBoardData() async {
    dashboardData = await ApiService.getDashboardData(widget.empId!);
    print(dashboardData);
    _empName = dashboardData.user.Name.toString();
    scheduleData = dashboardData.schedules;
    setState(() {});
  }

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
                padding: const EdgeInsets.only(
                    top: 100, bottom: 30, left: 20, right: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.redAccent),
                child: SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome! $_empName",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your Dashboard to track your work. ${widget.empId}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 254, 253, 253),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 239, 253),
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 19, 128))),
                    child: Column(
                      children: const [
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
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 239, 253),
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 19, 128))),
                    child: Column(
                      children: const [
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
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: scheduleData.length,
                  itemBuilder: (context, idx) => ListBox(
                      enrtyTime: DateTime.parse(scheduleData[idx].Entry),
                      exitTime: DateTime.parse(scheduleData[idx].Exit),
                      description: scheduleData[idx].Description,
                      name: _empName,
                      location: scheduleData[idx].Location)),
            )
          ],
        ),
      ),
    );
  }
}
