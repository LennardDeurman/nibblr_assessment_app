import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/base.dart';

class DinnerForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DinnerFormState();
  }

}

class DinnerFormState extends State<DinnerForm> with FormTextFields {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleTextController = TextEditingController();

  final TextEditingController _multiLineTextController = TextEditingController();

  final TextEditingController _maxMembersTextController = TextEditingController();

  final TextEditingController _startTextController = TextEditingController();

  final TextEditingController _endTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: textFormField(controller: _titleTextController, labelText: "Titel", hintText: "Bijv. Nasi Goreng eten"),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: multiLineTextField(controller: _multiLineTextController, labelText: "Omschrijving", hintText: "Vertel iets meer..."),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: textFormField(controller: _maxMembersTextController, labelText: "Hoeveel mensen mogen maximaal komen?", hintText: "Bijv. 6"),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                    controller: _startTextController
                ),
                DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    controller: _startTextController,
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Dag',
                    timeLabelText: "Uur"
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                    controller: _endTextController
                ),
                DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    controller: _endTextController,
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Dag',
                    timeLabelText: "Uur"
                ),
              ],
            ),
          )




        ],
      ),
    );
  }

}