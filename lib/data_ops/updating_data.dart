import 'package:http/http.dart' as http;
import 'package:car_workshop_app/data_ops/user_management.dart';

import '../constants.dart';
import '../models/customer.dart';
import '../models/job.dart';
import '../models/part_service.dart';
import '../models/vehicle.dart';

Future<String> updateCustomer(
  Customer customer,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  String customerID = customer.customerID;
  String firstName = customer.firstName;
  String lastName = customer.lastName;
  String contact1 = customer.contact1;
  String contact2 = customer.contact2 ?? "";
  String contact3 = customer.contact3 ?? "";

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/update_customer_info.php?username=$username&hash=$hash&customerID=$customerID&firstName=$firstName&lastName=$lastName&contactNum1=$contact1&contactNum2=$contact2&contactNum3=$contact3"));
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

Future<String> updateVehicleInfo(
  Vehicle vehicle,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  String vehicleNumber = vehicle.vehicleNumber;
  String make = vehicle.make;
  String made = vehicle.made ?? "";
  String model = vehicle.model;
  String customerID = vehicle.customerID;

  try {
    var result = await http.get(Uri.parse(
        "http://localhost/update_vehicle_info.php?username=$username&hash=$hash&vehicleNumber=$vehicleNumber&make=$make&made=$made&model=$model&customerID=$customerID"));
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

Future<String> updateJobInfo(
  Job job,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  String customerComplaint = job.customerComplaint;
  String jobID = job.jobID;
  String workDetails = job.workDetails ?? "";
  String price = job.price.toString();
  String paid = job.paid.toString();
  String dateTimeAdded = job.dateTimeAdded.toString();
  String dateTimeFinished =
      job.dateTimeFinished != null ? job.dateTimeFinished.toString() : "";
  String kilometers = job.kilometers.toString();

  try {
    var result = await http.get(Uri.parse(
        "http://localhost/update_job_info.php?username=$username&hash=$hash&jobID=$jobID&customerComplaint=$customerComplaint&workDetails=$workDetails&price=$price&paid=$paid&addedDateTime=$dateTimeAdded&finishedDateTime=$dateTimeFinished&kilometers=$kilometers"));

    print(result.body);
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

Future<String> updatePartServiceInfo(
  String oldName,
  PartService partService,
) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  String name = partService.name;
  String type = partService.type;
  String cost = partService.cost.toString();
  String supplier = partService.supplier ?? "";
  String jobID = partService.jobID;
  String timeAdded = partService.timeAdded.toString();
  String details = partService.details ?? "";



  try {
    var result = await http.get(Uri.parse(
        "http://localhost/update_partService.php?username=$username&hash=$hash&oldName=$oldName&name=$name&type=$type&cost=$cost&supplier=$supplier&jobID=$jobID&addedDateTime=$timeAdded&details=$details"));

    print("'${result.body}'");

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
