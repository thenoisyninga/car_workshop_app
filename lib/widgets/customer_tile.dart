import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    super.key,
    required this.customerID,
    required this.firstName,
    required this.lastName,
    required this.contact1,
    required this.contact2,
    required this.contact3,
  });

  final String customerID;
  final String firstName;
  final String lastName;
  final String contact1;
  final String? contact2;
  final String? contact3;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor,
      title: Text(
        "$firstName $lastName",
      ),
      subtitle: Text("Customer ID: $customerID"),
      trailing: Text(contact1),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerInfo(
              customerID: customerID,
            ),
          ),
        );
      },
    );
  }
}
