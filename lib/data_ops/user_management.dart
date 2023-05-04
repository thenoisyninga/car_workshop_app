import 'package:car_workshop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

Future<String> verifyCredentials(String username, String hash) async {
  try {
    var result = await http.get(Uri.parse(
        "http://$webServerAddress/verify_user.php?username=$username&hash=$hash"));
    if (result.body == "1") {
      return "SUCCESS";
    } else if (result.body == "0") {
      return "FAILED";
    } else {
      return result.statusCode.toString();
    }
  } on Exception catch (_) {
    return "ERROR";
  }
}
