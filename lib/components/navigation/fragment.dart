import 'package:flutter/material.dart';

abstract class Fragment extends StatefulWidget {

  Fragment ({ GlobalKey key }) : super(key: key);

  @override
  FragmentState<Fragment> createState();

}

abstract class FragmentState<T extends Fragment> extends State<T> {

  @override
  Widget build(BuildContext context);

  void onFloatingButtonPressed(BuildContext context) {

  }

}