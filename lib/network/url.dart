class ApiUrl {

  final String route;

  static String host = "http://localhost:8000/api";

  ApiUrl (this.route );

  @override
  String toString() {
    return "$host/$route";
  }
}