import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ListBox extends StatelessWidget {
  final DateTime enrtyTime;
  final DateTime exitTime;
  final String description;
  final String name;
  final String location;

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
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: const Border(
          //   left: BorderSide(width: 1, color: Colors.blue),
          // ),
          color: const Color.fromARGB(255, 215, 239, 253),
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
            child: Text('${enrtyTime.day}\n${enrtyTime.month}'),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              const SizedBox(height: 10),
              Text(DateFormat('hh:mm a').format(enrtyTime) +
                  ' - ' +
                  DateFormat('hh:mm a').format(exitTime)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Clip(iconData: Icons.pin, label: location),
                  const SizedBox(width: 10),
                  Clip(iconData: Icons.verified_user_rounded, label: name)
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
  final String label;
  const Clip({Key? key, required this.iconData, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [Icon(iconData), const SizedBox(width: 10), Text(label)],
      ),
    );
  }
}
