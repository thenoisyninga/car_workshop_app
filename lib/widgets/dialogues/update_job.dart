// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:car_workshop_app/data_ops/updating_data.dart';
import 'package:flutter/material.dart';

import '../../models/job.dart';

class UpdateJobDialogue extends StatefulWidget {
  const UpdateJobDialogue({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  State<UpdateJobDialogue> createState() => _UpdateJobDialogueState();
}

class _UpdateJobDialogueState extends State<UpdateJobDialogue> {
  TextEditingController customerComplaintController = TextEditingController();
  TextEditingController workDetailsController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController dateTimeAddedController = TextEditingController();
  TextEditingController dateTimeFinishedController = TextEditingController();
  TextEditingController kilometersController = TextEditingController();

  String? costError;
  String? priceError;
  String? paidError;
  String? kilometersError;

  DateTime? dateTimeAdded;
  DateTime? dateTimeFinished;
  String? customerComplaint;
  String? workDetails;

  @override
  void initState() {
    super.initState();

    customerComplaint = widget.job.customerComplaint;
    workDetails = widget.job.workDetails;
    costController.text = widget.job.cost.toString();
    priceController.text = widget.job.price.toString();
    paidController.text = widget.job.paid.toString();
    dateTimeAdded = widget.job.dateTimeAdded;
    dateTimeFinished = widget.job.dateTimeFinished;
    kilometersController.text = widget.job.kilometers.toString();
  }

  @override
  Widget build(BuildContext context) {
    customerComplaintController.text = customerComplaint ?? "";
    workDetailsController.text = workDetails ?? "";
    dateTimeAddedController.text = dateTimeAdded.toString().substring(0, 10);
    dateTimeFinishedController.text = dateTimeFinished != null
        ? dateTimeFinished.toString().substring(0, 10)
        : "";
    return AlertDialog(
      title: const Text(
        "Edit Job",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 450,
        width: 600,
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: (800 / 2) / 100,
                children: [
                  SizedBox(
                    height: 10,
                    child: TextField(
                      maxLines: null,
                      readOnly: true,
                      style: TextStyle(color: Colors.grey[200]),
                      controller: customerComplaintController,
                      decoration: const InputDecoration(
                        label: Text("Customer Complaint"),
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Customer Complaint",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: SizedBox(
                            height: 350,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextField(
                                  controller: customerComplaintController,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    constraints: BoxConstraints(
                                      maxHeight: 300,
                                      minHeight: 300,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      customerComplaint =
                                          customerComplaintController.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Set"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      maxLines: null,
                      readOnly: true,
                      style: TextStyle(color: Colors.grey[200]),
                      controller: workDetailsController,
                      decoration: const InputDecoration(
                        label: Text("Work Details"),
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Work Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: SizedBox(
                            height: 350,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextField(
                                  controller: workDetailsController,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    constraints: BoxConstraints(
                                      maxHeight: 300,
                                      minHeight: 300,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      workDetails = workDetailsController.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Set"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ).then((value) => setState(() {})),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: costController,
                      decoration: InputDecoration(
                        label: const Text("Cost"),
                        errorText: costError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: paidController,
                      decoration: InputDecoration(
                        label: const Text("Paid"),
                        errorText: paidError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? dateTimeChosen = await showDatePicker(
                          context: context,
                          initialDate: dateTimeAdded ?? DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );

                        if (dateTimeChosen != null) {
                          setState(() {
                            dateTimeAdded = dateTimeChosen;
                          });
                        }
                      },
                      style: TextStyle(color: Colors.grey[200]),
                      controller: dateTimeAddedController,
                      decoration: const InputDecoration(
                        label: Text("Added At"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        dateTimeFinished = await showDatePicker(
                          context: context,
                          initialDate: dateTimeFinished ?? DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );

                        if (dateTimeFinished != null) {
                          setState(() {
                            dateTimeFinishedController.text =
                                dateTimeFinished.toString().substring(0, 10);
                          });
                        }
                      },
                      style: TextStyle(color: Colors.grey[200]),
                      controller: dateTimeFinishedController,
                      decoration: InputDecoration(
                        label: const Text("Finished At"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              dateTimeFinished = null;
                            });
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: kilometersController,
                      decoration: InputDecoration(
                        label: const Text("Kilometers"),
                        errorText: kilometersError,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: updateJob,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Update Job",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 95,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateJob() async {
    String customerComplaint = customerComplaintController.text;
    String workDetails = workDetailsController.text;
    String cost = costController.text;
    String price = priceController.text;
    String paid = paidController.text;
    String kilometers = kilometersController.text;

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    // Cost Checks
    if (cost.isEmpty) {
      setState(() {
        setState(() {
          costError = "Required Field";
        });
      });
    } else if (double.tryParse(cost) == null) {
      setState(() {
        costError = "Invalid";
      });
    } else {
      setState(() {
        costError = null;
      });
    }

    // Price Check
    if (price.isEmpty) {
      setState(() {
        setState(() {
          priceError = "Required Field";
        });
      });
    } else if (double.tryParse(price) == null) {
      setState(() {
        priceError = "Invalid";
      });
    } else {
      setState(() {
        priceError = null;
      });
    }

    // Paid Check
    if (paid.isEmpty) {
      setState(() {
        setState(() {
          paidError = "Required Field";
        });
      });
    } else if (double.tryParse(paid) == null) {
      setState(() {
        paidError = "Invalid";
      });
    } else {
      setState(() {
        paidError = null;
      });
    }

    // Kilometers Check
    if (kilometers.isEmpty) {
      setState(() {
        setState(() {
          kilometersError = "Required Field";
        });
      });
    } else if (double.tryParse(kilometers) == null) {
      setState(() {
        kilometersError = "Invalid";
      });
    } else {
      setState(() {
        kilometersError = null;
      });
    }

    if (costError == null &&
        priceError == null &&
        paidError == null &&
        kilometersError == null) {
      Job updatedJob = Job(
        widget.job.jobID,
        customerComplaint,
        workDetails,
        double.parse(cost),
        double.parse(price),
        double.parse(paid),
        widget.job.vehicleNumber,
        dateTimeAdded ?? DateTime.now(),
        dateTimeFinished,
        double.parse(kilometers),
      );
      var result = await updateJobInfo(updatedJob);
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Job Updated"),
        ));
      } else if (result == "ERROR" || result == "FAILED") {
        Navigator.pop(context);
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
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Error: Status Code: $result",
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Okay"))
            ],
          ),
        );
      }
    } else {
      Navigator.pop(context);
      setState(() {});
    }
  }
}
