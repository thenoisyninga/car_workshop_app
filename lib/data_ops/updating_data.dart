import 'package:http/http.dart' as http;
import 'package:car_workshop_app/data_ops/user_management.dart';

import '../constants.dart';
import '../models/customer.dart';

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
