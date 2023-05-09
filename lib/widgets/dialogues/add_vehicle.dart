// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:flutter/material.dart';

class AddVehicleDialogue extends StatefulWidget {
  const AddVehicleDialogue({
    super.key,
    required this.customerID,
  });

  final String customerID;

  @override
  State<AddVehicleDialogue> createState() => _AddVehicleDialogueState();
}

class _AddVehicleDialogueState extends State<AddVehicleDialogue> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController madeController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  String? vehicleNumberError;
  String? makeError;
  String? modelError;

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
                      controller: vehicleNumberController,
                      decoration: InputDecoration(
                        label: const Text("Vehicle Number*"),
                        errorText: vehicleNumberError,
                      ),
                    ),
                  ),
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
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addNewVehicle,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Add New Vehicle",
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

  Future<void> addNewVehicle() async {
    String vehicleNumber = vehicleNumberController.text;
    String make = makeController.text;
    String made = madeController.text;
    String model = modelController.text;

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Center(
                child: CircularProgressIndicator(),
              ),
            ));

    if (vehicleNumber.isEmpty) {
      vehicleNumberError = "Required Field";
    } else if (await vehicleExistsCheck(vehicleNumber)) {
      vehicleNumberError = "Vehicle already registered";
    } else {
      vehicleNumberError = null;
    }
    if (make.isEmpty) {
      makeError = "Required Field";
    } else {
      makeError = null;
    }
    if (model.isEmpty) {
      modelError = "Required Field";
    } else {
      modelError = null;
    }

    if (vehicleNumber.isNotEmpty &&
        make.isNotEmpty &&
        model.isNotEmpty &&
        !(await vehicleExistsCheck(vehicleNumber))) {
      var result = await addVehicle(
        vehicleNumber,
        make,
        made,
        model,
        widget.customerID,
      );
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Vehicle added"),
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
