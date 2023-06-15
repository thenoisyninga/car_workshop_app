import 'package:flutter/material.dart';

class PartServiceLabelHeader extends StatelessWidget {
  const PartServiceLabelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
          child: const Text(
            "Name and Type",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
          child: const Text(
            "Detail",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
            child: const Text(
              "Supplier",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
            child: const Text(
              "Quantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
            child: const Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
            child: const Text(
              "Cost",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
        )
      ]),
    );
  }
}
