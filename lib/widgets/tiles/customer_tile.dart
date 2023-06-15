import 'package:auto_size_text/auto_size_text.dart';
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
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: AutoSizeText(
                    customer.customerID,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: Text(
                    customer.firstName,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: AutoSizeText(
                    customer.lastName,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: AutoSizeText(
                    customer.contact1,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: AutoSizeText(
                    customer.contact2 ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                  child: AutoSizeText(
                    customer.contact3 ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
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
