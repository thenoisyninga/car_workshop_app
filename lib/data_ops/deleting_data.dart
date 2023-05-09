import 'package:car_workshop_app/data_ops/user_management.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<String> deletePartServiceCloud(String name, String jobID) async {
  String username = getSessionUsername();
  String hash = getSessionHash();

  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/delete_PartService.php?username=$username&hash=$hash&name=$name&jobID=$jobID"));
    if (result.statusCode == 200) {
      return "SUCCESS";
    } else {
      return result.statusCode.toString();
    }
  } on Exception catch (_) {
    return "ERROR";
  }
}
