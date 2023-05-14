import 'package:flutter/material.dart';

import '../data_ops/searching_data.dart';
import '../models/customer.dart';
import '../widgets/tiles/customer_tile.dart';

class SearchCustomer extends StatefulWidget {
  const SearchCustomer({super.key});

  @override
  State<SearchCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
  TextEditingController customerIDController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactNum1Controller = TextEditingController();
  TextEditingController contactNum2Controller = TextEditingController();
  TextEditingController contactNum3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Search Customer",
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
                        controller: customerIDController,
                        decoration:
                            const InputDecoration(label: Text("Customer ID")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: firstNameController,
                        decoration:
                            const InputDecoration(label: Text("First Name")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: lastNameController,
                        decoration:
                            const InputDecoration(label: Text("Last Name")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: contactNum1Controller,
                        decoration: const InputDecoration(
                            label: Text("Phone Number 1")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: contactNum2Controller,
                        decoration: const InputDecoration(
                            label: Text("Phone Number 2")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        style: TextStyle(color: Colors.grey[200]),
                        controller: contactNum3Controller,
                        decoration: const InputDecoration(
                            label: Text("Phone Number 3")),
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

            // Search Results
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: FutureBuilder(
                    future: searchCustomer(
                      customerIDController.text,
                      firstNameController.text,
                      lastNameController.text,
                      contactNum1Controller.text,
                      contactNum2Controller.text,
                      contactNum3Controller.text,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Customer> searchResults = snapshot.data!;
                        return ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: ((context, index) {
                              return CustomerTile(
                                customer: searchResults[index],
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
