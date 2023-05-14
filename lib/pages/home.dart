import 'package:car_workshop_app/constants.dart';
import 'package:car_workshop_app/pages/recent_jobs.dart';
import 'package:car_workshop_app/pages/search_customer.dart';
import 'package:car_workshop_app/pages/search_vehicle.dart';
import 'package:car_workshop_app/widgets/dialogues/add_customer.dart';
import 'package:flutter/material.dart';
import '../data_ops/user_management.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Logged in as ${getSessionUsername()}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: logout,
                    icon: const Icon(Icons.logout),
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const AddCustomerDialogue());
              },
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.3 < 400
                      ? 400
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Add Customer",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.3 < 400
                      ? 400
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Search Customer",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.3 < 400
                      ? 400
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Search Vehicle",
                    style: TextStyle(fontSize: 20),
                  )),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            // Recent Jobs Button
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecentJobs(),
                ),
              ),
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.3 < 400
                      ? 400
                      : MediaQuery.of(context).size.width * 0.3,
                  child: const Text(
                    "Recent Jobs",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure you want to log out?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      removeUserCredentials();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    },
                    child: const Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No")),
              ],
            ));
  }
}
