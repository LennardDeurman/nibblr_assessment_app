import 'package:http/http.dart' as http;
import 'package:nibblr/network/request.dart';
import 'package:nibblr/network/url.dart';
import 'package:nibblr/network/parsing_operation.dart';

enum RequestMethod {
  get,
  post,
  delete,
  put
}

class RequestHelper {

  ApiRequest apiRequest({ String route }) {
    return ApiRequest(
      ApiUrl(
          route
      ),
    );
  }

  Future<http.Response> executeRequest({ String route,  RequestMethod method = RequestMethod.get, Map<String, dynamic> body }) async {
    var request = apiRequest(
        route: route
    );
    http.Response response;
    if (request.headers == null)
      request.headers = {};
    request.headers["Accept"] = "application/json";

    if (method == RequestMethod.get) {
      response = await request.get();
    } else if (method == RequestMethod.post) {
      request.headers["Content-Type"] = "application/json";
      response = await request.post(body: body);
    } else if (method == RequestMethod.put) {
      response = await request.put(body: body);
    } else if (method == RequestMethod.delete) {
      response = await request.delete();
    }
    return response;
  }

  Future<T> singleObjectRequest<T>({ String route, T Function(Map) toObject, RequestMethod method = RequestMethod.get, Map<String, dynamic> body, Function(Map map) findRootInMap}) async {

    var response = await executeRequest(
        route: route,
        method: method,
        body: body
    );



    var object = ParsingOperation<T>(response, toObject: (Map map) {
      return toObject(map);
    }, findRootInMap: findRootInMap).singleObject();

    if (object == null) {
      throw Exception("No data from server");
    }
    return object;
  }

  Future<List<T>> multiObjectsRequest<T>({ String route, T Function(Map) toObject, RequestMethod method = RequestMethod.get, Map<String, dynamic> body, Function(Map map) findRootInMap}) async {
    var response = await executeRequest(
        route: route,
        method: method,
        body: body
    );

    var objects = ParsingOperation<T>(response, toObject: (Map map) {
      return toObject(map);
    }, findRootInMap: findRootInMap).asList();

    if (objects == null) {
      throw Exception("No data from server");
    }

    return objects;
  }


}

class SecuredRequestHelper extends RequestHelper {

  final String accessToken;

  SecuredRequestHelper (this.accessToken);

  @override
  ApiRequest apiRequest({String route}) {
    return SecuredApiRequest(
        ApiUrl(
            route
        ),
        accessToken: accessToken
    );
  }

}