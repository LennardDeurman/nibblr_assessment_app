import 'package:flutter/material.dart';
import 'package:nibblr/components/navigation/fragment.dart';
import 'package:nibblr/components/navigation/navigation_drawer.dart';

class UserProfileNavigationChild extends NavigationDrawerChild {

  final GlobalKey<UserProfileFragmentState> fragmentKey = GlobalKey<UserProfileFragmentState>();

  @override
  Fragment body(BuildContext context) {
    return UserProfileFragment(
      key: fragmentKey
    );
  }

  @override
  String title(BuildContext context) {
    return "Mijn profiel";
  }

}


class UserProfileFragment extends Fragment {

  UserProfileFragment ({ GlobalKey key }) : super(key: key);

  @override
  FragmentState<Fragment> createState() {
    return UserProfileFragmentState();
  }

}

class UserProfileFragmentState extends FragmentState<UserProfileFragment> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}