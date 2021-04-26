import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteWidget extends StatefulWidget {

  final quote;
  final author;
  final  onSharClick;
  final Function onLikeClick;
  final Color bgColor;
  


  QuoteWidget({this.quote = "", this.author= "", this.onSharClick, this.onLikeClick, this.bgColor,});

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {

  var fav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Image.asset(
              'assets/quote.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            SizedBox(height: 30),
            Text(
              widget.quote,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "~${widget.author}~",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      setState(() {
                        fav = !fav;
                                            });
                    },
                    child: Icon(
                      fav ? Icons.favorite:
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: widget.onSharClick,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      );
  }
}