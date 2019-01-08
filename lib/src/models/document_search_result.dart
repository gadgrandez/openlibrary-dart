import 'package:meta/meta.dart';

class DocumentSearchResult {
  final List<String> authorKey;
  final List<String> authorName;
  final List<int> publishYear;
  final List<String> isbn;  
  final List<String> subject;
  final String title;
  final String titleSuggest;

  DocumentSearchResult({this.titleSuggest, @required this.isbn, @required this.authorName, @required this.authorKey, @required this.subject, this.title, this.publishYear});

  static List<DocumentSearchResult> createList(List<dynamic> list){
    if(list.length <= 0) return null;
    List<DocumentSearchResult> _result = new List<DocumentSearchResult>();
    for(Map<String, dynamic> item in list){
      _result.add(new DocumentSearchResult(
        titleSuggest: item["title_suggest"] ?? "",
        isbn: new List<String>.from(item["isbn"]),
        authorName: new List<String>.from(item["author_name"]),
        authorKey: new List<String>.from(item["author_key"]),
        subject: new List<String>.from(item["subject"]),
        title: item["title"],
        publishYear: new List<int>.from(item["publish_year"])
      ));
    }

    return _result;
  }
}