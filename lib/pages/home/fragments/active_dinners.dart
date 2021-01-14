import 'package:flutter/material.dart';
import 'package:nibblr/components/navigation/fragment.dart';
import 'package:nibblr/components/navigation/navigation_drawer.dart';

class ActiveDinnersNavigationChild extends NavigationDrawerChild {

  final GlobalKey<ActiveDinnersFragmentState> fragmentKey = GlobalKey<ActiveDinnersFragmentState>();

  @override
  String title(BuildContext context) {
    return "Beschikbare etentjes";
  }

  @override
  Fragment body(BuildContext context) {
    return ActiveDinnersFragment(
      key: fragmentKey
    );
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => fragmentKey.currentState.onFloatingButtonPressed(context),
    );
  }

}


class ActiveDinnersFragment extends Fragment {

  ActiveDinnersFragment ({ GlobalKey key }) : super(key: key);

  @override
  FragmentState<Fragment> createState() {
    return ActiveDinnersFragmentState();
  }

}

class ActiveDinnersFragmentState extends FragmentState<ActiveDinnersFragment> {

  ActiveDinnersFragmentState ();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}