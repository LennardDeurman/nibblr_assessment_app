import 'package:http/http.dart' as http;
import 'dart:convert';

class ParsingOperation<T> {

  final http.Response response;
  final T Function(Map map) toObject;
  final dynamic Function(Map map) findRootInMap;

  ParsingOperation (this.response, { this.toObject, this.findRootInMap });



  dynamic rootObject(Map<String, dynamic> root) {
    if (this.findRootInMap != null) {
      return this.findRootInMap(root);
    }
    return root["data"];
  }

  List<T> asList() {
    String body = response.body;
    String message = json.decode(body)["message"];
    if (message != null) {
      throw Exception(message);
    }

    List<T> items = [];
    if (body != null) {
      var jsonObj = rootObject(json.decode(body));
      if (jsonObj != null) {
        if (jsonObj is List) {
          items = jsonObj.map((e) => this.toObject(e)).toList();
        } else if (jsonObj is Map) {
          T item = this.toObject(jsonObj);
          items.add(item);
        }
      }
    }

    return items;
  }

  T singleObject() {
    List<T> items = asList();
    if (items.length > 0) {
      return items.first;
    }
    return null;
  }

}