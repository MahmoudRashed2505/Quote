import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Text(
          "Choose the Categories you like:\n",
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        
        Spacer(),
      ],
    );
  }
}
