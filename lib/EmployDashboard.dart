import 'package:employee_management/HomePage.dart';
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
  String _empName = "Loading....";
  String _empDesignation = "Loading....";
  double _empMonthlyWork = 0.0;
  double _empMonthlyEarning = 0.0;
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
    if (dashboardData.user?.name != null) {
      _empName = dashboardData.user!.name.toString();
    }
    _empMonthlyEarning = dashboardData.earningMonth!;
    _empMonthlyWork = dashboardData.totalHoursWorked!;
    scheduleData = dashboardData.schedules!;
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
                    top: 40, bottom: 30, left: 20, right: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.redAccent),
                child: SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(72, 255, 255, 255)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
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
                      const Text(
                        "Your Dashboard to track your work.",
                        style: TextStyle(
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
                      children: [
                        const Icon(
                          Icons.access_time_filled_rounded,
                          size: 40,
                          color: Color.fromARGB(255, 0, 19, 128),
                        ),
                        const Text(
                          "Monthly Work Hours:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          _empMonthlyWork.toStringAsFixed(3),
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
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 40,
                          color: Color.fromARGB(255, 0, 19, 128),
                        ),
                        Text(
                          "Monthly earning:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          _empMonthlyEarning.toStringAsFixed(3),
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
              height: 10,
            ),
            Text(
              "Your Schedules",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 19, 128),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 380,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  itemCount: scheduleData.length,
                  itemBuilder: (context, idx) => ListBox(
                      enrtyTime:
                          DateTime.parse(scheduleData[idx].entry.toString()),
                      exitTime:
                          DateTime.parse(scheduleData[idx].exit.toString()),
                      description: scheduleData[idx].description,
                      name: _empName,
                      location: scheduleData[idx].location)),
            )
          ],
        ),
      ),
    );
  }
}
