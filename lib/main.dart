import 'package:car_workshop_app/constants.dart';
import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:car_workshop_app/pages/home.dart';
import 'package:car_workshop_app/pages/job_display.dart';
import 'package:car_workshop_app/pages/login.dart';
import 'package:car_workshop_app/pages/search_customer.dart';
import 'package:car_workshop_app/pages/search_vehicle.dart';
import 'package:car_workshop_app/pages/vehicle_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor? primaryColor = Colors.blue;
    return MaterialApp(
      title: workshopName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: Colors.grey[900],
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[850],
          focusColor: Colors.grey[800],
          labelStyle: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w300,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor.withAlpha(170),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red.withAlpha(170),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': ((context) => const Login()),
        '/home': ((context) => const Home()),
        '/search_customer': ((context) => const SearchCustomer()),
        '/search_vehicle': ((context) => const SearchVehicle()),
        '/customer_info': ((context) => const CustomerInfo(customerID: '', firstName: '', lastName: '', contact1: '')),
        '/vehicle_info': (context) => const VehicleInfo(vehicleNumber: "",),
        '/job_info': (context) => const JobInfo(jobID: ""),

      },
    );
  }
}
