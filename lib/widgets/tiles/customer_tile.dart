import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:flutter/material.dart';

import '../../models/customer.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerInfo(
              customerID: customer.customerID,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${customer.firstName} ${customer.lastName}",
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Customer ID: ${customer.customerID}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                    ),
                  ],
                ),
                Text(
                  customer.contact1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
