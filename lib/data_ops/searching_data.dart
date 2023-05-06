import 'dart:convert';

import 'package:car_workshop_app/data_ops/user_management.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/customer.dart';
import '../models/vehicle.dart';

Future<List<Customer>?> searchCustomer(
  String customerID,
  String firstName,
  String lastName,
  String contactNum1,
  String contactNum2,
  String contactNum3,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();
  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/search_customer.php?username=$username&hash=$hash&customerID=$customerID&firstName=$firstName&lastName=$lastName&contactNum1=$contactNum1&contactNum2=$contactNum2&contactNum3=$contactNum3"));
    if (result.statusCode == 200) {
      return result.body
          .split("%SEPERATOR%")
          .sublist(0, result.body.split("%SEPERATOR%").length - 1)
          .map((e) {
        Map customerData = json.decode(e);
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
      }).toList();
    } else {
      return null;
    }
  } on Exception catch (_) {
    return null;
  }
}

Future<List<Vehicle>?> searchVehicle(
  String vehicleNumber,
  String make,
  String made,
  String model,
  String customerID,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();
  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/search_vehicle.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber&make=$make&made=$made&model=$model&customerID=$customerID"));
    print("http://$webServerAddress/search_vehicle.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber&make=$make&made=$made&model=$model&customerID=$customerID");
    if (result.statusCode == 200) {
      return result.body
          .split("%SEPERATOR%")
          .sublist(0, result.body.split("%SEPERATOR%").length - 1)
          .map((e) {
        Map vehicleData = json.decode(e);
        return Vehicle(
          vehicleData["Vehicle Number"],
          vehicleData["Make"],
          vehicleData["Made"] == "" ? null : vehicleData["Made"],
          vehicleData["Model"],
          vehicleData["CustomerID"],
        );
      }).toList();
    } else {
      return null;
    }
  } on Exception catch (_) {
    return null;
  }
}
