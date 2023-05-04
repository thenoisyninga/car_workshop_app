import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_workshop_app/widgets/vehicle_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/job_tile.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({
    super.key,
    required this.vehicleNumber,
  });

  final String vehicleNumber;

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  final String customerID = "1";
  final String make = "Hyundai";
  final String model = "Santro";
  final String? made = "2003";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Vehicle Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      widget.vehicleNumber,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    AutoSizeText(
                      model,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AutoSizeText(
                      "$make, $made",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    AutoSizeText(
                      "Customer 1",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    AutoSizeText(
                      "Sarim Ahmed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AutoSizeText(
                      "0300-2147987",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
                child: Container(
              // color: Colors.black,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Text(
                        "Jobs on this vehicle",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView(
                        children: const [
                          JobTile(jobID: "1"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
