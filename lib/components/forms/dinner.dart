import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/base.dart';
import 'package:nibblr/models/dinner.dart';

class DinnerForm extends StatefulWidget {

  final Function(Dinner dinner) saveDinner;

  DinnerForm ({ @required this.saveDinner });

  @override
  State<StatefulWidget> createState() {
    return DinnerFormState();
  }

}

class DinnerFormState extends State<DinnerForm> with FormTextFields {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleTextController = TextEditingController();

  final TextEditingController _descriptionTextController = TextEditingController();

  final TextEditingController _maxMembersTextController = TextEditingController();

  final TextEditingController _startTextController = TextEditingController();

  final TextEditingController _endTextController = TextEditingController();


  void _onSubmitPressed() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      Dinner dinner = Dinner.create();
      dinner.title = _titleTextController.text;
      dinner.maxMembers = int.parse(_maxMembersTextController.text);
      dinner.description = _descriptionTextController.text;
      dinner.start = DateTime.parse(_startTextController.text);
      dinner.end = DateTime.parse(_endTextController.text);
      widget.saveDinner(dinner);
    }
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
            child: textFormField(context, controller: _titleTextController, labelText: "Titel", hintText: "Bijv. Nasi Goreng eten", ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: multiLineTextField(context, controller: _descriptionTextController, labelText: "Omschrijving", hintText: "Vertel iets meer...", required: false),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: textFormField(context, controller: _maxMembersTextController, labelText: "Hoeveel mensen mogen maximaal komen?", hintText: "Bijv. 6"),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                    controller: _startTextController,
                  enabled: false,
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
                    controller: _endTextController,
                    enabled: false,
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
          ),
          RaisedButton(
            child: Text("Aanmaken", style: TextStyle(color: Colors.white)),
            onPressed: _onSubmitPressed,
          )




        ],
      ),
    );
  }

}