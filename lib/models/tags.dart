import 'package:flutter/cupertino.dart';

class Tags extends ChangeNotifier{
  String sId;
  String name;
  int iV;
  int quoteCount;

  Tags({this.sId, this.name, this.iV, this.quoteCount});

  Tags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
    quoteCount = json['quoteCount'];
  }

}
