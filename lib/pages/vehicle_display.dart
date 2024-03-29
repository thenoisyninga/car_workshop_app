import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_workshop_app/models/vehicle.dart';
import 'package:car_workshop_app/widgets/dialogues/add_job.dart';
import 'package:car_workshop_app/widgets/dialogues/update_vehicle.dart';
import 'package:flutter/material.dart';

import '../data_ops/fetching_data.dart';
import '../models/customer.dart';
import '../models/job.dart';
import '../widgets/tiles/job_tile.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Vehicle Info"),
        centerTitle: true,
        actions: [
          FutureBuilder(
              future: getVehicle(widget.vehicleNumber),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                    onPressed: () => showDialog(
                            context: context,
                            builder: (context) =>
                                UpdateVehicleDialogue(vehicle: snapshot.data!))
                        .then((value) => setState(() {})),
                    icon: const Icon(Icons.edit),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
      body: FutureBuilder(
          future: getVehicle(widget.vehicleNumber),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Vehicle vehicle = snapshot.data!;
              return Padding(
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
                              vehicle.model,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AutoSizeText(
                              "${vehicle.make}, ${vehicle.made}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder(
                            future: getCustomer(vehicle.customerID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Customer customer = snapshot.data!;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AutoSizeText(
                                      "Customer ${customer.customerID}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "${customer.firstName} ${customer.lastName}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AutoSizeText(
                                      customer.contact1,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                        child: FutureBuilder(
                            future: getCustomer(vehicle.customerID),
                            builder: (context, snapshot) {
                              return Column(
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: FutureBuilder(
                                          future: getJobsForVehicle(
                                              widget.vehicleNumber),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<Job> jobs = snapshot.data!;
                                              return ListView.builder(
                                                  itemCount: jobs.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return JobTile(
                                                      jobID: jobs[index].jobID,
                                                    );
                                                  });
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AddJobDialogue(
                                          vehicleNumber: vehicle.vehicleNumber,
                                        ),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: const Text(
                                        "Add New Job",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }))
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
