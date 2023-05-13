// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:flutter/material.dart';

class AddJobDialogue extends StatefulWidget {
  const AddJobDialogue({
    super.key,
    required this.vehicleNumber,
  });

  final String vehicleNumber;

  @override
  State<AddJobDialogue> createState() => _AddJobDialogueState();
}

class _AddJobDialogueState extends State<AddJobDialogue> {
  TextEditingController customerComplaintController = TextEditingController();
  TextEditingController workDetailsController = TextEditingController();
  TextEditingController kilometersController = TextEditingController();
  TextEditingController dateTimeAddedController = TextEditingController();

  DateTime? dateTimeAdded = DateTime.now();
  String? kilometersError;
  String? dateTimeAddedError;

  @override
  Widget build(BuildContext context) {
    dateTimeAddedController.text =
        dateTimeAdded != null ? dateTimeAdded.toString().substring(0, 10) : "";

    return AlertDialog(
      title: const Text(
        "Add Job",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 280,
        width: 600,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: (600 / 2) / 100,
                children: [
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: customerComplaintController,
                      decoration: const InputDecoration(
                        label: Text("Customer Complaint"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: workDetailsController,
                      decoration: const InputDecoration(
                        label: Text("Work Details"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        dateTimeAdded = await showDatePicker(
                          context: context,
                          initialDate: dateTimeAdded ?? DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );

                        if (dateTimeAdded != null) {
                          setState(() {
                            dateTimeAddedController.text =
                                dateTimeAdded.toString().substring(0, 10);
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
                      keyboardType: TextInputType.number,
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
                  onPressed: addNewJob,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Add New Job",
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

  Future<void> addNewJob() async {
    String vehicleNumber = widget.vehicleNumber;
    String kilometers = kilometersController.text;
    String customerComplaint = customerComplaintController.text;
    String workDetails = workDetailsController.text;

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Center(
                child: CircularProgressIndicator(),
              ),
            ));

    if (kilometers.isEmpty) {
      kilometersError = "Required Field";
    } else if (double.tryParse(kilometers) == null) {
      kilometersError = "This field requires a number";
    } else {
      kilometersError = null;
    }

    if (dateTimeAdded == null) {
      dateTimeAddedError = "Required Field";
    } else {
      dateTimeAddedError = null;
    }

    if (kilometers.isNotEmpty &&
        double.tryParse(kilometers) != null &&
        dateTimeAdded != null) {
      var result = await addJob(
        customerComplaint,
        workDetails,
        vehicleNumber,
        dateTimeAdded!,
        double.parse(kilometers),
      );
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Job added"),
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
                child: const Text("Okay"),
              )
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
