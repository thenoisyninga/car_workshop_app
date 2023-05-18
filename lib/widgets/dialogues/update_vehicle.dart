// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:car_workshop_app/data_ops/updating_data.dart';
import 'package:flutter/material.dart';

import '../../models/vehicle.dart';

class UpdateVehicleDialogue extends StatefulWidget {
  const UpdateVehicleDialogue({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  State<UpdateVehicleDialogue> createState() => _UpdateVehicleDialogueState();
}

class _UpdateVehicleDialogueState extends State<UpdateVehicleDialogue> {
  TextEditingController makeController = TextEditingController();
  TextEditingController madeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController customerIDController = TextEditingController();

  String? customerIDError;
  String? makeError;
  String? modelError;

  @override
  void initState() {
    super.initState();
    makeController.text = widget.vehicle.make;
    madeController.text = widget.vehicle.made ?? "";
    modelController.text = widget.vehicle.model;
    customerIDController.text = widget.vehicle.customerID;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add Vehicle",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 320,
        width: 600,
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: (600 / 2) / 100,
                children: [
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: makeController,
                      decoration: InputDecoration(
                        label: const Text("Make*"),
                        errorText: makeError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: modelController,
                      decoration: InputDecoration(
                        label: const Text("Model*"),
                        errorText: modelError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: madeController,
                      decoration: const InputDecoration(label: Text("Made")),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: customerIDController,
                      decoration: InputDecoration(
                        label: const Text("Owner ID"),
                        errorText: customerIDError,
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
                  onPressed: updateVehicle,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Update Vehicle",
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

  Future<void> updateVehicle() async {
    String customerID = customerIDController.text;
    String make = makeController.text;
    String made = madeController.text;
    String model = modelController.text;

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    if (!(await customerExistsCheck(customerID))) {
      setState(() {
        customerIDError = "Customer does not exist";
      });
    } else {
      setState(() {
        customerIDError = null;
      });
    }
    if (make.isEmpty) {
      setState(() {
        makeError = "Required Field";
      });
    } else {
      setState(() {
        makeError = null;
      });
    }
    if (model.isEmpty) {
      setState(() {
        modelError = "Required Field";
      });
    } else {
      setState(() {
        modelError = null;
      });
    }

    if (makeError == null && modelError == null && customerIDError == null) {
      Vehicle updatedVehicle = Vehicle(
        widget.vehicle.vehicleNumber,
        make,
        made,
        model,
        customerID,
      );
      var result = await updateVehicleInfo(updatedVehicle);
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Vehicle Updated"),
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
