import 'package:flutter/material.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = false;
  String? passwordError;
  String? usernameError;

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
                style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorText: usernameError,
                    label: const Text("Username"),
                  )
              ),
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
          ],
        ),
      ),
    );
  }
}
