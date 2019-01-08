import 'dart:convert';

import 'src/models/search_result_model.dart';
import 'package:http/http.dart' as http;

export 'src/models/search_result_model.dart';
export 'src/models/document_search_result.dart';

class OPLibrary {

  static final String _opUrl = "https://openlibrary.org";
  static final String _searchOpUrl = '$_opUrl/search.json';

  static bool _initialized = false;

  OPLibrary() {
    if(_initialized)return;
    _initialized = true;
  }

  //#region OpenLibrary API Search
  Future<http.Response> _search(String query) async {
    return await http.get(Uri.encodeFull(query), headers: {"Accept": "application/json"});
  }
  Future<SearchResult> search(String query) async {
    String q = '$_searchOpUrl?q=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) {
      return null;
    }
    SearchResult result = SearchResult.fromMap(json.decode(response.body));
    return result;
  }
  Future<SearchResult> searchByTitle(String query) async {
    String q = '$_searchOpUrl?title=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) return null;
    return SearchResult.fromMap(json.decode(response.body));
  }
  Future<SearchResult> searchByAuthor(String query) async {
    String q = '$_searchOpUrl?title=$query';
    http.Response response = await _search(q);
    if(response.statusCode != 200) return null;
    return SearchResult.fromMap(json.decode(response.body));
  }
  // TODO: Implementar función de búsqueda por páginas
  //#endregion

  static final OPLibrary instance = OPLibrary();
}