import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote/models/quotes2.dart';
import 'package:quote/shared/quote_widget.dart';
import 'package:random_color/random_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RandomColor _randomColor = RandomColor();
  var initial = false;
  List<Quote> quotes = [];
  

  @override
  void didChangeDependencies() async {
    quotes.add(new Quote(author: 'Mahmoud Rashed',content: "Nothing is Impossible"));
    final quotesData = Provider.of<Quotes>(context);
    if (!initial) {
      await quotesData.fetchData();
      quotes = quotesData.results;
      initial =true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quotesData = Provider.of<Quotes>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomSheet: ,
      body: FutureBuilder<List<Quote>>(
        future: quotesData.fetchData(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return ErrorWidget(snapshot.error);
            }
            return PageView.builder(itemBuilder: (context, index) {
                  var model = snapshot.data[index];
                  return QuoteWidget(
                    quote: model.content,
                    author: model.author,
                    bgColor: _randomColor.randomColor(
                      colorHue: ColorHue.multiple(
                        colorHues: [ColorHue.red, ColorHue.blue],
                      ),
                    ),
                    onSharClick: null,
                  );
                });
              } else {
                return Center(child: Image.asset('assets/loading.gif', width:double.infinity,height: double.infinity, ),);
              }
          }
        
      )
      );
    
  }
}
