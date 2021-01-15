import 'package:nibblr/models/address.dart';
import 'package:nibblr/models/base.dart';

class UserKeys {
  static const String firstName = "first_name";
  static const String lastName = "last_name";
  static const String bio = "bio";
  static const String email = "email";
  static const String address = "address";
}

class User extends BaseObject {

  String firstName;
  String lastName;
  String bio;
  String email;
  Address address;


  User (Map<String, dynamic> dictionary) : super(dictionary);

  @override
  void parse(Map<String, dynamic> dictionary) {
    super.parse(dictionary);

    firstName = dictionary[UserKeys.firstName];
    lastName = dictionary[UserKeys.lastName];
    bio = dictionary[UserKeys.bio];
    email = dictionary[UserKeys.email];

    var addressDict = dictionary[UserKeys.address];
    if (addressDict != null) {
      address = Address(addressDict);
    }


  }

  String get fullName => "$firstName $lastName";

  @override
  Map<String, dynamic> toMap() {
    var dict = super.toMap();
    dict.addAll({
      UserKeys.firstName: firstName,
      UserKeys.lastName: lastName,
      UserKeys.bio: bio,
      UserKeys.email: email,
      UserKeys.address: BaseObject.mapIfNotNull(address)
    });
    return dict;
  }
}