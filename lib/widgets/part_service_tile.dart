import 'package:flutter/material.dart';

class PartServiceTile extends StatelessWidget {
  const PartServiceTile(
      {super.key,
      required this.name,
      required this.type,
      required this.cost,
      required this.supplier,
      required this.jobID,
      required this.timeAdded});

  final String name;
  final String type;
  final double cost;
  final String? supplier;
  final String jobID;
  final DateTime timeAdded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 17),),
                Text(type, style: const TextStyle(fontSize: 15),),
              ],
            ),
            Text( supplier != null ? "Supplied by $supplier": ""),
            Text("Rs.$cost"),
          ],
        ),
      ),
    );
  }
}
