import 'package:nibblr/models/base.dart';

class AddressKeys {
  static const String id = "id";
  static const String postalCode = "postal_code";
  static const String number = "number";
  static const String street = "street";
  static const String city = "city";
}

class Address extends BaseObject {

  String postalCode;
  String number;
  String street;
  String city;

  Address (Map<String, dynamic> dictionary) : super(dictionary);

  @override
  void parse(Map<String, dynamic> dictionary) {
    super.parse(dictionary);
    postalCode = dictionary[AddressKeys.postalCode];
    number = dictionary[AddressKeys.number];
    street = dictionary[AddressKeys.street];
    city = dictionary[AddressKeys.city];
  }

  @override
  Map<String, dynamic> toMap() {
    var superDict = super.toMap();
    superDict.addAll({
      AddressKeys.id: id,
      AddressKeys.postalCode: postalCode,
      AddressKeys.number: number,
      AddressKeys.street: street,
      AddressKeys.city: city
    });
    return superDict;
  }

}