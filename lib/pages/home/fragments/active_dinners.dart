import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nibblr/components/cells/dinner.dart';
import 'package:nibblr/components/navigation/fragment.dart';
import 'package:nibblr/components/navigation/navigation_drawer.dart';
import 'package:nibblr/logic/downloader.dart';
import 'package:nibblr/models/dinner.dart';
import 'package:nibblr/network/api.dart';

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

  FutureBuilderDownloader<Dinner> _downloader;


  @override
  void initState() {

    _downloader = FutureBuilderDownloader(
      futureInvoker: () {
        return Api().getDinners();
      }
    );
    _downloader.refresh();

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        Completer completer = Completer();
        setState(() {
          _downloader.refresh().whenComplete(() {
            completer.complete();
          });
        });
        return completer.future;
      },
      child: FutureBuilder(
          future: _downloader.future,
          builder: (BuildContext context, AsyncSnapshot<List<Dinner>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (BuildContext context, int position) {
                return DinnerCell(snapshot.data[position]);
              }, itemCount: snapshot.data.length);
            }
            return ListView();
          }
      ),
    );
  }

}