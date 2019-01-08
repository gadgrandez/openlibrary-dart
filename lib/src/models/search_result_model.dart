import 'document_search_result.dart';
import 'package:meta/meta.dart';

class SearchResult {
  
  final int start;
  final int numFound;
  final List<DocumentSearchResult> docs;

  SearchResult({@required this.start, @required this.numFound, this.docs});

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return new SearchResult(
      start: map["start"] ?? 0,
      numFound: map["num_found"] ?? 0,
      docs: DocumentSearchResult.createList(map["docs"])
    );
  } 

  Map<String, dynamic> toJson() => {};
}