import 'package:car_workshop_app/models/vehicle.dart';
import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:car_workshop_app/pages/vehicle_display.dart';
import 'package:flutter/material.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VehicleInfo(
              vehicleNumber: vehicle.vehicleNumber,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${vehicle.model} (${vehicle.vehicleNumber})",
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      vehicle.make,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    "Customer ${vehicle.customerID}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 51, 51),
                      decoration: TextDecoration.underline
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerInfo(
                          customerID: vehicle.customerID,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
