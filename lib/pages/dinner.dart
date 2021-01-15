import 'package:flutter/material.dart';
import 'package:nibblr/helpers/dates.dart';
import 'package:nibblr/models/dinner.dart';

class DinnerDetailsPage extends StatefulWidget {

  final Dinner dinner;

  DinnerDetailsPage (this.dinner);

  @override
  State<StatefulWidget> createState() {
    return DinnerDetailsPageState();
  }

}

class DinnerDetailsPageState extends State<DinnerDetailsPage> {



  @override
  void initState() {
    super.initState();
  }

  Widget textBox({ @required String label, @required String value }) {
    return Container(margin: EdgeInsets.all(20), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
        )),
        SizedBox(height: 10),
        Text(value, style: TextStyle(
            fontSize: 13
        ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dinner.title),
      ),
      body: Container(
        child: ListView(
          children: [
            textBox(label: "Omschrijving", value: widget.dinner.description),
            textBox(label: "Datum & tijd", value: "${DateUtil.friendlyFormat(widget.dinner.start)} - ${DateUtil.friendlyFormat(widget.dinner.end)}"),
            textBox(label: "Organisator", value: widget.dinner.host.fullName),
            textBox(label: "Adres", value: widget.dinner.address.toString()),
            textBox(label: "Wie komen er?", value: widget.dinner.guests.map((e) => e.fullName).toList().join(", "))
          ],
        ),
      ),
    );
  }


}