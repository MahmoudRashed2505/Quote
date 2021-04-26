import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote/screens/login_screen.dart';

class IntroScreen extends StatelessWidget {
  final double height = 40;
  final double width = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Image.asset(
              "assets/quote.png",
              height: height,
              width: width,
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 60,
                    color: Colors.black,
                  ),
                ),
                children: [
                  TextSpan(text: "Get\n"),
                  TextSpan(
                    text: "Inspired",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Let's Go",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
