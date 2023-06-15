import 'package:car_workshop_app/widgets/label_headers/vehicle_label_header.dart';
import 'package:flutter/material.dart';

import '../data_ops/searching_data.dart';
import '../models/vehicle.dart';
import '../widgets/tiles/vehicle_tile.dart';

class SearchVehicle extends StatefulWidget {
  const SearchVehicle({super.key});

  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController madeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController customerIDController = TextEditingController();
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
                  children: [
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: vehicleNumberController,
                        decoration: const InputDecoration(
                            label: Text("Vehicle Number")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: customerIDController,
                        decoration:
                            const InputDecoration(label: Text("CustomerID")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: makeController,
                        decoration: const InputDecoration(label: Text("Make")),
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
                        controller: modelController,
                        decoration: const InputDecoration(label: Text("Model")),
                      ),
                    ),
                  ],
                )),

            // Search Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
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

            const VehicleLabelHeader(),

            // Search Results
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: FutureBuilder(
                    future: searchVehicle(
                      vehicleNumberController.text,
                      makeController.text,
                      madeController.text,
                      modelController.text,
                      customerIDController.text,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Vehicle> searchResults = snapshot.data!;
                        return ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: ((context, index) {
                              return VehicleTile(
                                vehicle: searchResults[index],
                              );
                            }));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
