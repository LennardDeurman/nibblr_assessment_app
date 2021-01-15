import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/dinner.dart';
import 'package:nibblr/helpers/progress_dialog.dart';
import 'package:nibblr/models/dinner.dart';
import 'package:nibblr/network/api.dart';

class CreateDinnerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CreateDinnerPageState();
  }

}

class CreateDinnerPageState extends State<CreateDinnerPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void saveDinner(Dinner dinner) {
    Future future = Api().createDinner(dinner);
    ProgressDialogHelper.attach(context, future);
    future.then((v) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Successvol opgeslagen")));
    });
    future.catchError((e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Er ging iets mis!")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: DinnerForm(
            saveDinner: saveDinner,
          ),
        )

      ),
    );
  }

}