
class Quotes {
  int count;
  int totalCount;
  int lastItemIndex;
  List<Results> results;

  Quotes({this.count, this.totalCount, this.lastItemIndex, this.results});

  Quotes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalCount = json['totalCount'];
    lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      List<Results> results = [];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  
}

class Results {
  List<String> tags;
  String sId;
  String content;
  String author;
  String authorSlug;
  int length;

  Results(
      {this.tags,
      this.sId,
      this.content,
      this.author,
      this.authorSlug,
      this.length});

  Results.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    authorSlug = json['authorSlug'];
    length = json['length'];
  }

}

