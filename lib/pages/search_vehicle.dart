import 'package:flutter/material.dart';

import '../widgets/customer_tile.dart';
import '../widgets/vehicle_tile.dart';

class SearchVehicle extends StatefulWidget {
  const SearchVehicle({super.key});

  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Search Vehicle",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Search Queries
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: GridView.count(
                  padding: const EdgeInsets.all(8.0),
                  childAspectRatio: MediaQuery.of(context).size.width / 3 / 70,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                  children: const [
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration:
                            InputDecoration(label: Text("Vehicle Number")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("CustomerID")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("Make")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("Made")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("Model")),
                      ),
                    ),
                  ],
                )),

            // Search Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 23),
                    ),
                  )),
            ),

            // Search Results
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView(
                  children: const [
                    VehicleTile(
                      vehicleNumber: "AGD423",
                      customerID: "1",
                      make: "Hyundai",
                      made: "2006",
                      model: "Santro",
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
