import 'dart:convert';

import 'package:bookingapp/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();

    TextEditingController password = TextEditingController();
    void loginUser() async {
      var response = await http.post(
        Uri.parse("http://192.168.0.109:5000/users/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name.text,
          "email": email.text,
          "password": password.text,
        }),
      );
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ));
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "This email is already in use",
          ),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "name",
                labelText: "name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: Text("register"),
            )
          ],
        ),
      ),
    );
  }
}
