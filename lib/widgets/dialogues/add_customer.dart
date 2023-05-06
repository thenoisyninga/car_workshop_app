import 'package:car_workshop_app/data_ops/adding_data.dart';
import 'package:flutter/material.dart';

import '../../models/customer.dart';

class AddCustomerDialogue extends StatefulWidget {
  const AddCustomerDialogue({super.key});

  @override
  State<AddCustomerDialogue> createState() => _AddCustomerDialogueState();
}

class _AddCustomerDialogueState extends State<AddCustomerDialogue> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactNum1Controller = TextEditingController();
  TextEditingController contactNum2Controller = TextEditingController();
  TextEditingController contactNum3Controller = TextEditingController();

  String? firstNameError;
  String? lastNameError;
  String? contactNum1Error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add Customer",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 350,
        width: 600,
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: (600 / 2) / 80,
                children: [
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: firstNameController,
                      decoration: InputDecoration(
                        label: const Text("First Name*"),
                        errorText: firstNameError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: lastNameController,
                      decoration: InputDecoration(
                        label: const Text("Last Name*"),
                        errorText: lastNameError,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: contactNum1Controller,
                      decoration: InputDecoration(
                        label: const Text("Phone Number 1*"),
                        errorText: contactNum1Error,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: contactNum2Controller,
                      decoration:
                          const InputDecoration(label: Text("Phone Number 2")),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: TextField(
                      style: TextStyle(color: Colors.grey[200]),
                      controller: contactNum3Controller,
                      decoration:
                          const InputDecoration(label: Text("Phone Number 3")),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: addNewCustomer,
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 600,
                child: const Text(
                  "Add New Customer",
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

  Future<void> addNewCustomer() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String contactNum1 = contactNum1Controller.text;
    String contactNum2 = contactNum2Controller.text;
    String contactNum3 = contactNum3Controller.text;

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Center(
                child: CircularProgressIndicator(),
              ),
            ));

    if (firstName.isEmpty) {
      firstNameError = "Required Field";
    } else {
      firstNameError = null;
    }
    if (lastName.isEmpty) {
      lastNameError = "Required Field";
    } else {
      lastNameError = null;
    }
    if (contactNum1.isEmpty) {
      contactNum1Error = "Required Field";
    } else {
      contactNum1Error = null;
    }

    if (firstName.isNotEmpty && lastName.isNotEmpty && contactNum1.isNotEmpty) {
      var result = await addCustomer(
        firstName,
        lastName,
        contactNum1,
        contactNum2,
        contactNum3,
      );
      if (result == "SUCCESS") {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Customer added"),
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
