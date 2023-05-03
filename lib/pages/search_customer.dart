import 'package:flutter/material.dart';

import '../widgets/customer_tile.dart';

class SearchCustomer extends StatefulWidget {
  const SearchCustomer({super.key});

  @override
  State<SearchCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
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
                  children: const [
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("Customer ID")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("First Name")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration: InputDecoration(label: Text("Last Name")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration:
                            InputDecoration(label: Text("Phone Number 1")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration:
                            InputDecoration(label: Text("Phone Number 2")),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      child: TextField(
                        decoration:
                            InputDecoration(label: Text("Phone Number 3")),
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
                  children:const [
                    CustomerTile(
                      customerID: "1",
                      firstName: "Sarim",
                      lastName: "Ahmed",
                      contact1: "0300-2214731",
                      contact2: "0300-2214732",
                      contact3: "0300-2214733",
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
