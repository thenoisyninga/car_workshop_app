import 'package:car_workshop_app/pages/vehicle_display.dart';
import 'package:flutter/material.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({
    super.key,
    required this.vehicleNumber,
    required this.customerID,
    required this.make,
    required this.made,
    required this.model,
  });

  final String vehicleNumber;
  final String customerID;
  final String make;
  final String? made;
  final String model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Text(
        "$model, $vehicleNumber",
      ),
      subtitle: Text("$made, $make"),
      trailing: Text("Owner ID: $customerID"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VehicleInfo(
              vehicleNumber: vehicleNumber,
            ),
          ),
        );
      },
    );
  }
}
