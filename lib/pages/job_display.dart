// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_workshop_app/data_ops/fetching_data.dart';
import 'package:car_workshop_app/models/customer.dart';
import 'package:flutter/material.dart';

import '../data_ops/deleting_data.dart';
import '../models/job.dart';
import '../models/part_service.dart';
import '../models/vehicle.dart';
import '../widgets/tiles/part_service_tile.dart';

class JobInfo extends StatefulWidget {
  const JobInfo({super.key, required this.jobID});

  final String jobID;

  @override
  State<JobInfo> createState() => _JobInfoState();
}

class _JobInfoState extends State<JobInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Job: ${widget.jobID}"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getJob(widget.jobID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Job job = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder(
                        future: getVehicle(job.vehicleNumber),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Vehicle vehicle = snapshot.data!;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      vehicle.vehicleNumber,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    AutoSizeText(
                                      vehicle.model,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "${vehicle.make}, ${vehicle.made}",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Added at",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          job.dateTimeAdded
                                              .toString()
                                              .substring(0, 10),
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Finished at",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          job.dateTimeFinished != null
                                              ? job.dateTimeFinished
                                                  .toString()
                                                  .substring(0, 10)
                                              : "-",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                FutureBuilder(
                                    future: getCustomer(vehicle.customerID),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        Customer customer = snapshot.data!;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            AutoSizeText(
                                              "Customer ${customer.customerID}",
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                            AutoSizeText(
                                              "${customer.firstName} ${customer.lastName}",
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            AutoSizeText(
                                              customer.contact1,
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    })
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Customer Complaint
                        Container(
                          color: Colors.grey[800],
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Customer Complaint",
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      job.customerComplaint,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        // Work Details
                        Container(
                          color: Colors.grey[800],
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Work Details",
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      job.workDetails ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Parts/Services Arranged",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: FutureBuilder(
                            future: getPartServiceForJob(widget.jobID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<PartService> partServicesList =
                                    snapshot.data!;
                                return ListView.builder(
                                    itemCount: partServicesList.length,
                                    itemBuilder: (context, index) {
                                      return PartServiceTile(
                                        partService: partServicesList[index],
                                        deletePartServiceCallback:
                                            deletePartService,
                                      );
                                    });
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Add Part button
                          ElevatedButton(
                            onPressed: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (context) => AddPartServiceDialogue(
                              //     jobID: job.jobID,
                              //   ),
                              // );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Text("Add Part/Service"),
                            ),
                          ),
                          Container(
                            color: Colors.grey[800],
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Cost
                                      const AutoSizeText(
                                        "Cost",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      AutoSizeText(
                                        "Rs. ${job.cost}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),

                                  // Price
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const AutoSizeText(
                                        "Price",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      AutoSizeText(
                                        "Rs. ${job.price}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const AutoSizeText(
                                        "Paid",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      AutoSizeText(
                                        "Rs. ${job.paid}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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

  Future<void> deletePartService(String name, String jobID) async {
    String result = await deletePartServiceCloud(name, jobID);
    if (result == "SUCCESS") {
      setState(() {});
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$name deleted successfully")));
    } else if (result == "ERROR") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Unknown error occoured",
          ),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Okay"))
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Error occoured: Status code $result",
          ),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Okay"))
          ],
        ),
      );
    }
  }
}
