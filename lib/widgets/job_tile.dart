import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:flutter/material.dart';

import '../pages/vehicle_display.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    super.key,
    required this.jobID,
  });

  final String jobID;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTimeAdded = DateTime(2023);
    const String vehicleNumber = "AGD-423";
    return ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VehicleInfo(
                vehicleNumber: vehicleNumber,
              ),
            ),
          );
        },
        child: const Text(
          "Vehicle: $vehicleNumber",
        ),
      ),
      subtitle: Text("Job ID: $jobID"),
      trailing: Text(dateTimeAdded.toString().substring(0, 10)),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CustomerInfo(
        //       customerID: customerID,
        //       firstName: firstName,
        //       lastName: lastName,
        //       contact1: contact1,
        //       contact2: contact2,
        //       contact3: contact3,
        //     ),
        //   ),
        // );
      },
    );
  }
}
