import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_workshop_app/widgets/dialogues/add_vehicle.dart';
import 'package:car_workshop_app/widgets/dialogues/update_customer.dart';
import 'package:car_workshop_app/widgets/tiles/vehicle_tile.dart';
import 'package:flutter/material.dart';

import '../data_ops/fetching_data.dart';
import '../models/customer.dart';
import '../models/vehicle.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({
    super.key,
    required this.customerID,
  });

  final String customerID;

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
        actions: [
          FutureBuilder(
              future: getCustomer(widget.customerID),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                    onPressed: () => showDialog(
                            context: context,
                            builder: (context) => UpdateCustomerDialogue(
                                customer: snapshot.data!))
                        .then((value) => setState(() {})),
                    icon: const Icon(Icons.edit),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
      body: FutureBuilder(
          future: getCustomer(widget.customerID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Customer customer = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "${customer.firstName} ${customer.lastName}",
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
                              "Customer ID: ${customer.customerID}",
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
                            customer.contact3 != null
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
                                        customer.contact3!,
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
                            customer.contact2 != null
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
                                        customer.contact2!,
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
                                  customer.contact1,
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[800],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Expanded(
                              child: Text(
                                "${customer.firstName}'s Vehicles",
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
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: FutureBuilder(
                                  future:
                                      getVehiclesForCustomer(widget.customerID),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Vehicle> vehicles = snapshot.data!;
                                      return ListView.builder(
                                        itemCount: vehicles.length,
                                        itemBuilder: (context, index) {
                                          return VehicleTile(
                                            vehicle: vehicles[index],
                                          );
                                        },
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddVehicleDialogue(
                              customerID: customer.customerID,
                            ),
                          ).then((e) {
                            setState(() {});
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            "Add New Vehicle",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
