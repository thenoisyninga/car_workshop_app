import 'package:car_workshop_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:cryptography/cryptography.dart';

final _myBox = Hive.box("USER_SESSION_DATA");

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

bool getLoginStatus() {
  return _myBox.get("SESSION_USERNAME") != null;
}

String getSessionUsername() {
  return _myBox.get("SESSION_USERNAME");
}

String getSessionHash() {
  return _myBox.get("SESSION_HASH");
}

Future<String> hashPass(String passcode) async {
  final message = passcode.codeUnits;
  final algorithm = Sha512();
  final hash = await algorithm.hash(message);
  return hash.bytes.join("|");
}

void storeUserCredentials(String username, String hash) {
  _myBox.put("SESSION_USERNAME", username);
  _myBox.put("SESSION_HASH", hash);
}

void removeUserCredentials() {
  _myBox.put("SESSION_USERNAME", null);
  _myBox.put("SESSION_HASH", null);
}
