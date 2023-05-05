import 'dart:convert';
import 'package:car_workshop_app/data_ops/user_management.dart';
import 'package:car_workshop_app/models/customer.dart';
import 'package:car_workshop_app/models/job.dart';
import 'package:car_workshop_app/models/vehicle.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<Customer?> getCustomer(String customerID) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/get_customer.php?username=$username&hash=$hash&customerID=$customerID"));
    if (result.statusCode == 200) {
      Map customerData = json.decode(result.body);
      return Customer(
        customerData['CustomerID'],
        customerData['First Name'],
        customerData['Last Name'],
        customerData['Contact Number 1'],
        customerData['Contact Number 2'] == ""
            ? null
            : customerData['Contact Number 2'],
        customerData['Contact Number 3'] == ""
            ? null
            : customerData['Contact Number 3'],
      );
    } else {
      return null;
    }
  } on Exception catch (_) {
    return null;
  }
}

Future<Vehicle?> getVehicle(String vehicleNumber) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/get_vehicle.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber"));
    if (result.statusCode == 200) {
      Map vehicleData = json.decode(result.body);
      return Vehicle(
        vehicleData["Vehicle Number"],
        vehicleData["Make"],
        vehicleData["Made"] == "" ? null : vehicleData["Made"],
        vehicleData["Model"],
        vehicleData["CustomerID"],
      );
    } else {
      return null;
    }
  } on Exception catch (_) {
    return null;
  }
}

Future<Job?> getJob(String jobID) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/get_job.php?username=$username&hash=$hash&jobID=$jobID"));
    if (result.statusCode == 200) {
      Map jobData = json.decode(result.body);
      return Job(
        jobData["JobID"],
        jobData["Customer Complaint"],
        jobData["Work Details"],
        double.parse(jobData["Cost"]),
        double.parse(jobData["Price"]),
        double.parse(jobData["Paid"]),
        jobData["Vehicle Number"],
        DateTime.parse(jobData["DateTimeAdded"]),
        jobData["DateTimeFinished"].strip() == ""
            ? null
            : DateTime.parse(jobData["DateTimeFinished"]),
        double.parse(jobData["Kilometers"]),
      );
    } else {
      return null;
    }
  } on Exception catch (_) {
    return null;
  }
}
