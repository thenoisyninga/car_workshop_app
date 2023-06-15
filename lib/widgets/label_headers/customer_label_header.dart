import 'package:flutter/material.dart';

class CustomerLabelHeader extends StatelessWidget {
  const CustomerLabelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Customer ID",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "First Name",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Last Name",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Contact 1",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Contact 2",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
              child: const Text(
                "Contact 3",
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
