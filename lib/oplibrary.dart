import 'dart:convert';

import 'src/models/search_result_model.dart';
import 'package:http/http.dart' as http;

export 'src/models/search_result_model.dart';
export 'src/models/document_search_result.dart';

class OPLibrary {

  static final String _opUrl = "https://openlibrary.org";
  static final String _searchOpUrl = '$_opUrl/search.json';

  //#region OpenLibrary API Search
  static Future<http.Response> _search(String query) async {
    return await http.get(Uri.encodeFull(query), headers: {"Accept": "application/json"});
  }
  static Future<SearchResult> search(String query) async {
    String q = '$_searchOpUrl?q=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) {
      return null;
    }
    return SearchResult.fromMap(json.decode(response.body));
  }
  static Future<SearchResult> searchByTitle(String query) async {
    String q = '$_searchOpUrl?title=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) return null;
    return SearchResult.fromMap(json.decode(response.body));
  }
  static Future<SearchResult> searchByAuthor(String query) async {
    String q = '$_searchOpUrl?title=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) return null;
    return SearchResult.fromMap(json.decode(response.body));
  }
  // TODO: Implementar función de búsqueda por páginas
  //#endregion
}