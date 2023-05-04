// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../constants.dart';
import '../data_ops/user_management.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  String? passwordError;
  String? usernameError;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),

            // Workshop Name Title
            Text(
              workshopName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.15),

            // Login title
            const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),

            const SizedBox(
              height: 50,
            ),

            // Username Field
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50 > 400
                  ? 400
                  : MediaQuery.of(context).size.width * 0.50,
              child: TextField(
                  controller: usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorText: usernameError,
                    label: const Text("Username"),
                  )),
            ),

            const SizedBox(
              height: 20,
            ),

            // Password Field
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50 > 400
                  ? 400
                  : MediaQuery.of(context).size.width * 0.50,
              child: TextField(
                controller: passwordController,
                obscureText: hidePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  errorText: passwordError,
                  label: const Text("Password"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    splashRadius: 5,
                    icon: Icon(
                      hidePassword
                          ? Icons.remove_red_eye
                          : Icons.shield_outlined,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            // Login Button
            GestureDetector(
              onTap: login,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.50 > 400
                    ? 400
                    : MediaQuery.of(context).size.width * 0.50,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    String hash = await hashPass(password);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => AlertDialog(
            content: SizedBox(
              height: 100,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    "Processing..",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
            ),
          )),
    );
    String result = await verifyCredentials(username, hash);

    if (result == "SUCCESS") {
      storeUserCredentials(username, hash);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamed(context, "/home");
    } else if (result == "ERROR") {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Unknown Error Occoured"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Okay"),
            )
          ],
        ),
      );
    } else if (result == "FAILED") {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Incorrect username or password"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Okay"),
            )
          ],
        ),
      );
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Error Occoured, Code $result"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Okay"),
            )
          ],
        ),
      );
    }
  }
}
