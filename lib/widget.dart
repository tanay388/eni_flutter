import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ListBox extends StatelessWidget {
  final DateTime enrtyTime;
  final DateTime exitTime;
  final String? description;
  final String name;
  final String? location;

  const ListBox(
      {Key? key,
      required this.enrtyTime,
      required this.exitTime,
      required this.description,
      required this.name,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "June",
      "July",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          border: const Border(
            left: BorderSide(width: 6.0, color: Colors.redAccent),
          ),
          color: Color.fromARGB(255, 255, 216, 216),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 4,
            )
          ]),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  )
                ]),
            child: Text(
              '${enrtyTime.day}\n${months[enrtyTime.month]}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 10, 0, 123),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 210),
                child: Text(
                  description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                  softWrap: false,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 19, 128),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Text(DateFormat('hh:mm a').format(enrtyTime.toLocal()) +
                  ' - ' +
                  DateFormat('hh:mm a').format(exitTime.toLocal())),
              const SizedBox(height: 10),
              Row(
                children: [
                  Clip(iconData: Icons.pin_drop, label: location),
                  const SizedBox(width: 10),
                  // Clip(iconData: Icons.person, label: name)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Clip extends StatelessWidget {
  final IconData iconData;
  final String? label;
  const Clip({Key? key, required this.iconData, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: Color.fromARGB(255, 10, 0, 123),
            size: 20,
          ),
          const SizedBox(width: 5),
          Container(
              constraints: BoxConstraints(maxWidth: 210, minWidth: 40),
              child: Text(
                label!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 10, 0, 123),
                ),
              ))
        ],
      ),
    );
  }
}
