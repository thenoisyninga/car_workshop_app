import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_workshop_app/widgets/vehicle_tile.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({
    super.key,
    required this.customerID,
    required this.firstName,
    required this.lastName,
    required this.contact1,
    this.contact2,
    this.contact3,
  });

  final String customerID;
  final String firstName;
  final String lastName;
  final String contact1;
  final String? contact2;
  final String? contact3;

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Customer Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "${widget.firstName} ${widget.lastName}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Customer ID: ${widget.customerID}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Contact 3 if available
                    widget.contact3 != null
                        ? Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.contact3!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    // Contact 2 if available
                    widget.contact2 != null
                        ? Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.contact2!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),

                    // Contact 1
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.contact1,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
                child: Container(
              // color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Text(
                        "${widget.firstName}'s Vehicles",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView(
                        children: const [
                          VehicleTile(
                            vehicleNumber: "AGD423",
                            customerID: "1",
                            make: "Hyundai",
                            made: "2006",
                            model: "Santro",
                          ),
                          VehicleTile(
                            vehicleNumber: "AGD423",
                            customerID: "1",
                            make: "Hyundai",
                            made: "2006",
                            model: "Santro",
                          ),
                          VehicleTile(
                            vehicleNumber: "AGD423",
                            customerID: "1",
                            make: "Hyundai",
                            made: "2006",
                            model: "Santro",
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
