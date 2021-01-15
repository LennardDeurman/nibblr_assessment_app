import 'package:flutter/material.dart';
import 'package:nibblr/models/dinner.dart';

class DinnerCell extends StatelessWidget {

  final Dinner dinner;

  DinnerCell (this.dinner);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        dinner.title
      ),
    );
  }

}