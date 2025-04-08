import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login/Views/home.dart';
import 'package:shared_preferences_login/Views/splash_screen.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final myBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("LOGIN PAGE", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset("assets/facebookLogo.jpg", width: 150, height: 150),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // If credentials are correct, then:
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                maximumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
