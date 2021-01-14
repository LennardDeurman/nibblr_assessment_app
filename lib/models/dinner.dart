import 'package:nibblr/helpers/dates.dart';
import 'package:nibblr/models/address.dart';
import 'package:nibblr/models/base.dart';
import 'package:nibblr/models/user.dart';

class DinnerKeys {
  static const String start = "start";
  static const String end = "end";
  static const String title = "title";
  static const String description = "description";
  static const String maxMembers = "max_members";
  static const String host = "host";
  static const String address = "address";
  static const String guests = "guests";
}

class Dinner extends BaseObject {

  DateTime start;
  DateTime end;
  String title;
  String description;
  int maxMembers;
  Address address;
  User host;
  List<User> guests;

  Dinner (Map<String, dynamic> map) : super(map);

  @override
  void parse(Map<String, dynamic> dictionary) {
    super.parse(dictionary);
    start = DateUtil.parseDate(dictionary[DinnerKeys.start]);
    end = DateUtil.parseDate(dictionary[DinnerKeys.end]);
    title = dictionary[DinnerKeys.title];
    description = dictionary[DinnerKeys.description];
    maxMembers = dictionary[DinnerKeys.maxMembers];
    address = Address(dictionary[DinnerKeys.address]);
    host = User(dictionary[DinnerKeys.host]);

    List guestsDictList = dictionary[DinnerKeys.guests];
    guests = guestsDictList.map((e) => User(e)).toList();

  }

  @override
  Map<String, dynamic> toMap() {
    var dict = super.toMap();
    dict.addAll({
      DinnerKeys.start: DateUtil.toDateStr(start),
      DinnerKeys.end: DateUtil.toDateStr(end),
      DinnerKeys.title: title,
      DinnerKeys.description: description,
      DinnerKeys.maxMembers: maxMembers,
      DinnerKeys.address: address.toMap(),
      DinnerKeys.host: host.toMap()
    });
    return dict;
  }
}