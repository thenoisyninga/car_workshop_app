// ignore_for_file: use_build_context_synchronously

import 'package:car_workshop_app/data_ops/updating_data.dart';
import 'package:flutter/material.dart';

import '../../models/customer.dart';

class UpdateCustomerDialogue extends StatefulWidget {
  const UpdateCustomerDialogue({super.key, required this.customer});

  final Customer customer;

  @override
  State<UpdateCustomerDialogue> createState() => _UpdateCustomerDialogueState();
}

class _UpdateCustomerDialogueState extends State<UpdateCustomerDialogue> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactNum1Controller = TextEditingController();
  TextEditingController contactNum2Controller = TextEditingController();
  TextEditingController contactNum3Controller = TextEditingController();

  String? firstNameError;
  String? lastNameError;
  String? contactNum1Error;
  Customer? updatedCustomer;

  @override
  void initState() {
    super.initState();

    firstNameController.text = widget.customer.firstName;
    lastNameController.text = widget.customer.lastName;
    contactNum1Controller.text = widget.customer.contact1;
    contactNum2Controller.text = widget.customer.contact2 ?? "";
    contactNum3Controller.text = widget.customer.contact3 ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Update Customer ${widget.customer.customerID}",
        textAlign: TextAlign.center,
        style: const TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: updateOldCustomer,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 295,
                    child: const Text(
                      "Update Customer",
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

  Future<void> updateOldCustomer() async {
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
      Customer updatedCustomer = Customer(
        widget.customer.customerID,
        firstName,
        lastName,
        contactNum1,
        contactNum2.isEmpty ? null : contactNum2,
        contactNum3.isEmpty ? null : contactNum3,
      );
      var result = await updateCustomer(updatedCustomer);
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
