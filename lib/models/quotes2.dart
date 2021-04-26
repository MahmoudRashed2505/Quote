import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quotes extends ChangeNotifier {
  int count;
  int totalCount;
  int lastItemIndex;
  List<Quote> results = [];

  Quotes({this.count, this.totalCount, this.lastItemIndex, this.results});

  Future<List<Quote>> fetchData() async {
      List<Quote> quotable = [];

    print("Start Fetching Data...");
    final uri = "https://api.quotable.io/quotes";
    await http.get(Uri.parse(uri)).then((value) {
      final jsonData = json.decode(value.body);
      count = jsonData['count'];
      totalCount = jsonData['totalCount'];
      lastItemIndex = jsonData['lastItemIndex'];
      if (jsonData['results'] != null) {
        jsonData['results'].forEach((v) {
          if (Quote.fromJson(v) != null) {
            quotable.add(Quote.fromJson(v));
          }
        });
      }
    });
    return quotable;
  }

  Quotes.fromJson(String responseBody) {
    print("Start Converting Data...");
    final jsonData = json.decode(responseBody);
    count = jsonData['count'];
    totalCount = jsonData['totalCount'];
    lastItemIndex = jsonData['lastItemIndex'];
    if (jsonData['results'] != null) {
      jsonData['results'].forEach((v) {
        if (Quote.fromJson(v) != null) {
          results.add(Quote.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['totalCount'] = this.totalCount;
    data['lastItemIndex'] = this.lastItemIndex;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quote {
  List<String> tags;
  String sId;
  String content;
  String author;
  String authorSlug;
  int length;

  Quote(
      {this.tags,
      this.sId,
      this.content,
      this.author,
      this.authorSlug,
      this.length});

  Quote.fromJson(Map<String, dynamic> json) {
    print("Formating Quote...");
    tags = json['tags'].cast<String>();
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    authorSlug = json['authorSlug'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['author'] = this.author;
    data['authorSlug'] = this.authorSlug;
    data['length'] = this.length;
    return data;
  }
}
