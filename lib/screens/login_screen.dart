import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote/screens/home_screen.dart';
import 'package:quote/services/auth.dart';
import 'package:quote/shared/horizontal_or_line.dart';

class LoginScreen extends StatelessWidget {
  final Auth _auth = new Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                children: [
                  TextSpan(
                    text: "Hello,\n",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: "Welcome to Quote",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'assets/google_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: HorizontalOrLine(
                    label: 'Or',
                    height: 3,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var user = _auth.signInAnnon();
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Text("Continue as a Guest",
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      primary: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
