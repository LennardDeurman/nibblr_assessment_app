import 'package:nibblr/models/auth.dart';
import 'package:nibblr/models/dinner.dart';
import 'package:nibblr/models/login.dart';
import 'package:nibblr/models/registration.dart';
import 'package:nibblr/models/user.dart';
import 'package:nibblr/network/helper.dart';
import 'package:nibblr/network/routes.dart';

class Api {

  RequestHelper requestHelper;

  RequestHelper createRequestHelper() {
    return RequestHelper();
  }

  Api () {
    this.requestHelper = createRequestHelper();
  }

  Future<AuthResult> login(LoginData data) async {
    var result = await requestHelper.singleObjectRequest<AuthResult>(
        route: Routes.login,
        body: data.toMap(),
        method: RequestMethod.post,
        toObject: (Map map) => AuthResult(map)
    );
    return result;
  }

  Future<AuthResult> register(RegistrationData data) async {
    var result = await requestHelper.singleObjectRequest<AuthResult>(
        route: Routes.register,
        body: data.toMap(),
        method: RequestMethod.post,
        toObject: (Map map) => AuthResult(map)
    );
    return result;
  }

  Future<List<Dinner>> getDinners()  {
    return requestHelper.multiObjectsRequest<Dinner>(
      route: Routes.dinners,
      toObject: (Map map) => Dinner(map)
    );
  }

  Future<Dinner> getDinner(int dinnerId)  {
    return requestHelper.singleObjectRequest<Dinner>(
      route: Routes.dinner(dinnerId),
      toObject: (Map map) => Dinner(map)
    );
  }

  Future deleteDinner(int dinnerId) {
    return requestHelper.executeRequest(
      route: Routes.dinner(dinnerId),
      method: RequestMethod.delete
    );
  }

  Future<Dinner> createDinner(Dinner dinner) {
    return requestHelper.singleObjectRequest<Dinner>(
      route: Routes.dinner(dinner.id),
      body: dinner.toMap(),
      method: RequestMethod.post,
      toObject: (Map map) => Dinner(map)
    );
  }

  Future<Dinner> updateDinner(Dinner dinner) {
    return requestHelper.singleObjectRequest<Dinner>(
        route: Routes.dinner(dinner.id),
        body: dinner.toMap(),
        method: RequestMethod.put,
        toObject: (Map map) => Dinner(map)
    );
  }

  Future enrollForDinner(int dinnerId) {
    return requestHelper.executeRequest(
        route: Routes.dinnerEnrollment(dinnerId),
        method: RequestMethod.post
    );
  }

  Future deleteDinnerEnrollment(int dinnerId) {
    return requestHelper.executeRequest(
        route: Routes.dinnerEnrollment(dinnerId),
        method: RequestMethod.delete
    );
  }

  Future<User> updateUser(User user) {
    return requestHelper.singleObjectRequest<User>(
        route: Routes.profile,
        body: user.toMap(),
        method: RequestMethod.put,
        toObject: (Map map) => User(map)
    );
  }

  Future<User> getUser() {
    return requestHelper.singleObjectRequest<User>(
      route: Routes.profile
    );
  }



}

class SecuredApi extends Api {

  final String accessToken;

  SecuredApi (this.accessToken);

  @override
  RequestHelper createRequestHelper() {
    return SecuredRequestHelper(this.accessToken);
  }

}