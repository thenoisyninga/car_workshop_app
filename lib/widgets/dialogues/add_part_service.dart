// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:flutter/material.dart';

class AddPartServiceDialogue extends StatefulWidget {
  const AddPartServiceDialogue({
    super.key,
    required this.jobID,
  });

  final String jobID;

  @override
  State<AddPartServiceDialogue> createState() => _AddPartServiceDialogueState();
}

class _AddPartServiceDialogueState extends State<AddPartServiceDialogue> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController timeAddedController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  String? nameError;
  String? costError;
  String? supplierError;
  String type = "Part";

  DateTime dateTimeAdded = DateTime.now();

  @override
  Widget build(BuildContext context) {
    timeAddedController.text = dateTimeAdded.toString().substring(0, 10);
    typeController.text = type;
    return AlertDialog(
      title: const Text(
        "Add PartService",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 400,
        width: 600,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: (600 / 2) / 100,
                children: [
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: nameController,
                      decoration: InputDecoration(
                        label: const Text("Name"),
                        errorText: nameError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: typeController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        label: Text("Type"),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Choose Type"),
                            content: SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 200,
                                      child: const Text("Part"),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        type = "Part";
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 200,
                                      child: const Text("Service"),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        type = "Service";
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 200,
                                        child: const Text("External Service")),
                                    onPressed: () {
                                      setState(() {
                                        type = "External Service";
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
                      enabled: type == "Part" || type == "External Service",
                      style: TextStyle(color: Colors.grey[200]),
                      controller: supplierController,
                      decoration: InputDecoration(
                        label: const Text("Supplier"),
                        errorText: supplierError
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: dateTimeAdded,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );

                        if (selectedDate != null) {
                          setState(() {
                            dateTimeAdded = selectedDate;
                          });
                        }
                      },
                      style: TextStyle(color: Colors.grey[200]),
                      controller: timeAddedController,
                      decoration: const InputDecoration(
                        label: Text("Added At"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: detailsController,
                      decoration: const InputDecoration(
                        label: Text("Details"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: addNewPartService,
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 600,
                child: const Text(
                  "Add New PartService",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addNewPartService() async {
    String name = nameController.text;
    String type = typeController.text;
    String cost = costController.text;
    String supplier = supplierController.text;
    String details = detailsController.text;
    String jobID = widget.jobID;

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Center(
                child: CircularProgressIndicator(),
              ),
            ));

    if (name.isEmpty) {
      nameError = "Cannot be empty";
    } else {
      nameError = null;
    }
    if (cost.isEmpty) {
      costError = "Cannot be empty";
    } else if (double.tryParse(cost) == null) {
      costError = "Is not a number";
    } else {
      costError = null;
    }
    if (supplier.isEmpty && type == "External Service") {
      supplierError = "Cannot be empty for this type";
    } else {
      supplierError = null;
    }

    if (costError == null && nameError == null && supplierError == null) {
      String result = await addPartService(
        name,
        type,
        double.parse(cost),
        supplier,
        jobID,
        dateTimeAdded,
        details.isNotEmpty ? details : null,
      );
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("$type added"),
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
