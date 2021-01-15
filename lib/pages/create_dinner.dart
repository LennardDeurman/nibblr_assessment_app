import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/dinner.dart';

class CreateDinnerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CreateDinnerPageState();
  }

}

class CreateDinnerPageState extends State<CreateDinnerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: DinnerForm()
      ),
    );
  }

}