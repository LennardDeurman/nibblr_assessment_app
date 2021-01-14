import 'package:flutter/material.dart';
import 'package:nibblr/components/navigation/navigation_drawer.dart';
import 'package:nibblr/pages/home/fragments/active_dinners.dart';
import 'package:nibblr/pages/home/fragments/user_profile.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageDrawerNavigation {

  static const String activeDinners = "active_dinners";
  static const String userProfile = "my_profile";

  NavigationDrawerController _controller;
  NavigationDrawerController get controller => _controller;

  _HomePageDrawerNavigation () {
    _controller = NavigationDrawerController(
        children: {
          _HomePageDrawerNavigation.activeDinners: ActiveDinnersNavigationChild(),
          _HomePageDrawerNavigation.userProfile: UserProfileNavigationChild()
        },
        activeChildKey: _HomePageDrawerNavigation.activeDinners
    );
  }

  void goToActiveDinners() => _controller.navigate(_HomePageDrawerNavigation.activeDinners);

  void goToUserProfile() => _controller.navigate(_HomePageDrawerNavigation.userProfile);


}


class _HomePageState extends State<HomePage> {

  _HomePageDrawerNavigation _homePageDrawerNavigation;

  @override
  void initState() {
    _homePageDrawerNavigation = _HomePageDrawerNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _homePageDrawerNavigation.controller.notifier,
      builder: (BuildContext buildContext, NavigationDrawerChild value, Widget widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                _homePageDrawerNavigation.controller.activeChild.title(context)
            ),
          ),
          body: _homePageDrawerNavigation.controller.activeChild.body(context),
          floatingActionButton: _homePageDrawerNavigation.controller.activeChild.floatingActionButton(context),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Nibblr'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Beschikbare etentjes'),
                  onTap: () => _homePageDrawerNavigation.goToActiveDinners(),
                ),
                ListTile(
                  title: Text('Mijn profiel'),
                  onTap: () => _homePageDrawerNavigation.goToUserProfile(),
                ),
                ListTile(
                  title: Text('Uitloggen'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
        );
      }
    );

  }

}