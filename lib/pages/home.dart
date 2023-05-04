import 'package:car_workshop_app/constants.dart';
import 'package:car_workshop_app/pages/search_customer.dart';
import 'package:car_workshop_app/pages/search_vehicle.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person, size: 50,))],
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              workshopName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                print("working");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Logged in as sarim_ahmed",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.125 / 2,
            ),

            // Add Customer Button
            ElevatedButton(
              onPressed: () {},
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.3 < 600
                      ? 600
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Add Customer",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Search Customer Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchCustomer(),
                  ),
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.3 < 600
                      ? 600
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Search Customer",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Search Vehicle Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchVehicle(),
                  ),
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.3 < 600
                      ? 600
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Search Vehicle",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            const SizedBox(
              height: 30,
            ),

            // Recent Jobs Button
            ElevatedButton(
              onPressed: () {},
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.3 < 600
                      ? 600
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Recent Jobs",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
