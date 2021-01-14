import 'package:flutter/cupertino.dart';
import 'package:nibblr/components/navigation/fragment.dart';

class NavigationDrawerController {

  final Map<String, NavigationDrawerChild> children;

  ValueNotifier<NavigationDrawerChild> _notifier;

  ValueNotifier<NavigationDrawerChild> get notifier => _notifier;

  NavigationDrawerController ({ @required this.children, @required String activeChildKey }) {
    _notifier = ValueNotifier<NavigationDrawerChild>(
      this.children[activeChildKey]
    );
  }

  bool isActive(String key) => this.children[key] == _notifier.value;

  void navigate(String key) => _notifier.value = this.children[key];

  NavigationDrawerChild get activeChild => _notifier.value;

}

abstract class NavigationDrawerChild {

  NavigationDrawerChild ();

  Widget floatingActionButton(BuildContext context) {
    return null;
  }

  Fragment body(BuildContext context);

  String title(BuildContext context);

}

