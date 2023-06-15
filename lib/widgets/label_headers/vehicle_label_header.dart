import 'package:flutter/material.dart';

class VehicleLabelHeader extends StatelessWidget {
  const VehicleLabelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Model",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Registration #",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Make",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Made",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Owner ID",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
