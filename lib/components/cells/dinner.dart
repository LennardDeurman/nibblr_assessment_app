import 'package:flutter/material.dart';
import 'package:nibblr/helpers/dates.dart';
import 'package:nibblr/models/dinner.dart';

class DinnerCell extends StatelessWidget {

  final Dinner dinner;

  DinnerCell (this.dinner);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5
                )
              )
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(dinner.title, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      )),
                      Text(dinner.description, style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          dinner.host.fullName
                      ),
                      Text(
                          dinner.address.toString()
                      )
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    DateUtil.friendlyFormat(dinner.start),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {

          },
        ),
      ),
    );
  }

}