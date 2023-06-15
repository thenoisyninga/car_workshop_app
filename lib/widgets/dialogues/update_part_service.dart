// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/updating_data.dart';
import 'package:flutter/material.dart';

import '../../models/part_service.dart';

class UpdatePartServiceDialogue extends StatefulWidget {
  const UpdatePartServiceDialogue({
    super.key,
    required this.partService,
  });

  final PartService partService;

  @override
  State<UpdatePartServiceDialogue> createState() =>
      _UpdatePartServiceDialogueState();
}

class _UpdatePartServiceDialogueState extends State<UpdatePartServiceDialogue> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController timeAddedController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  String? nameError;
  String? costError;
  String? supplierError;
  String? quantityError;

  DateTime? dateTimeAdded;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.partService.name;
    typeController.text = widget.partService.type;
    costController.text = widget.partService.cost.toString();
    supplierController.text = widget.partService.supplier ?? "";
    dateTimeAdded = widget.partService.timeAdded;
    detailsController.text = widget.partService.details ?? "";
    quantityController.text = widget.partService.quantity.toString();
    statusController.text = widget.partService.status ?? "";
  }

  @override
  Widget build(BuildContext context) {
    timeAddedController.text = dateTimeAdded.toString().substring(0, 10);
    return AlertDialog(
      title: const Text(
        "Edit PartService",
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
                                        typeController.text = "Part";
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
                                        supplierController.text = "";
                                        typeController.text = "Service";
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
                                        typeController.text =
                                            "External Service";
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
                      enabled: typeController.text == "Part" ||
                          typeController.text == "External Service",
                      style: TextStyle(color: Colors.grey[200]),
                      controller: supplierController,
                      decoration: InputDecoration(
                          label: const Text("Supplier"),
                          errorText: supplierError),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: dateTimeAdded!,
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
                      readOnly: true,
                      style: TextStyle(color: Colors.grey[200]),
                      controller: detailsController,
                      decoration: const InputDecoration(
                        label: Text("Details"),
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Details",
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
                                  controller: detailsController,
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
                                    setState(() {});
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
                      controller: quantityController,
                      decoration: InputDecoration(
                        label: const Text("Quantity"),
                        errorText: quantityError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: statusController,
                      decoration: InputDecoration(
                        label: const Text("Status"),
                        errorText: nameError,
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
                  onPressed: updatePartService,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Update PartService",
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

  Future<void> updatePartService() async {
    String name = nameController.text;
    String type = typeController.text;
    String cost = costController.text;
    String supplier = supplierController.text;
    String details = detailsController.text;
    String quantity = quantityController.text;
    String status = statusController.text;

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

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
    if (quantity.isEmpty) {
      quantityError = "Cannot be empty";
    } else if (int.tryParse(quantity) == null) {
      quantityError = "Invalid quantity";
    } else {
      quantityError = null;
    }

    if (costError == null &&
        nameError == null &&
        supplierError == null &&
        quantityError == null) {
      PartService updatedPartService = PartService(
        name,
        type,
        double.parse(cost),
        supplier,
        widget.partService.jobID,
        dateTimeAdded!,
        details,
        int.parse(quantity),
        status,
      );

      var result = await updatePartServiceInfo(
          widget.partService.name, updatedPartService);
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("PartService Updated"),
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
