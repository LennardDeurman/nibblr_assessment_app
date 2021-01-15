import 'package:nibblr/helpers/dates.dart';

abstract class Mappable {

  Map<String, dynamic> toMap();

}

abstract class Parsable {
  void parse(Map<String, dynamic> dictionary);
}


class BaseObjectKeys {
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String id = 'id';
}

abstract class BaseObject with Parsable, Mappable {

  DateTime createdAt;
  DateTime updatedAt;
  int id;

  BaseObject (Map<String, dynamic> dictionary) {
    parse(dictionary);
  }

  BaseObject.create();

  @override
  void parse(Map<String, dynamic> dictionary) {
    id = dictionary[BaseObjectKeys.id];
    createdAt = DateUtil.parseDate(dictionary[BaseObjectKeys.createdAt]);
    updatedAt = DateUtil.parseDate(dictionary[BaseObjectKeys.updatedAt]);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      BaseObjectKeys.id: id
    };
  }

  static Map<String, dynamic> mapIfNotNull(Mappable serializable) {
    if (serializable != null) {
      return serializable.toMap();
    }
    return null;
  }

}