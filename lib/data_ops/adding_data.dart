import 'package:car_workshop_app/data_ops/user_management.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<String> addCustomer(
  String firstName,
  String lastName,
  String contact1,
  String contact2,
  String contact3,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/add_customer.php?username=$username&hash=$hash&firstName=$firstName&lastName=$lastName&contactNum1=$contact1&contactNum2=$contact2&contactNum3=$contact3"));
    if (result.statusCode == 200) {
      if (result.body == "1") {
        return "SUCCESS";
      } else {
        return "FAILED";
      }
    } else {
      return result.statusCode.toString();
    }
  } on Exception catch (_) {
    return "ERROR";
  }
}

Future<bool> vehicleExistsCheck(String vehicleNumber) async {
  String username = getSessionUsername();
  String hash = getSessionHash();
  try {
    var result = await http.get(Uri.parse(
        "http://localhost/vehicle_exists_check.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber"));
    if (result.statusCode == 200) {
      if (result.body == "0") {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  } on Exception catch (_) {
    return true;
  }
}

Future<String> addVehicle(
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
        "http://localhost/add_vehicle.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber&make=$make&made=$made&model=$model&customerId=$customerID"));
    if (result.statusCode == 200) {
      if (result.body == "1") {
        return "SUCCESS";
      } else {
        return "FAILED";
      }
    } else {
      return result.statusCode.toString();
    }
  } on Exception catch (_) {
    return "ERROR";
  }
}
