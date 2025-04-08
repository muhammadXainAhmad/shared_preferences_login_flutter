import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login/Views/login.dart';
import 'package:shared_preferences_login/Views/splash_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("HOME PAGE", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 200, color: Colors.blue),
            SizedBox(height: 20,),
            Text("USER IS LOGGED IN!",style: TextStyle(fontSize: 34),),
            SizedBox(height: 20,),
             ElevatedButton(
              onPressed: () async {
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyLoginPage()),
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
                "LOG OUT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
