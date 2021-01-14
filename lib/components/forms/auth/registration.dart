import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/auth/base.dart';

class RegistrationForm extends AuthForm {

  @override
  AuthFormState<AuthForm> createState() {
    return RegistrationFormState();
  }

}

class RegistrationFormState extends AuthFormState<RegistrationForm> {

  TextEditingController _emailTextController;

  TextEditingController _passwordTextController;

  TextEditingController _passwordConfirmationTextController;

  TextEditingController _firstNameTextController;

  TextEditingController _lastNameTextController;

  TextEditingController _bioTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordConfirmationTextController = TextEditingController();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _bioTextController = TextEditingController();
    super.initState();
  }

  @override
  List<Widget> children(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: textFormField(
            controller: _emailTextController,
            labelText: "Email",
            hintText: "Bijv. info@nibblr.nl"
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: textFormField(
            controller: _passwordTextController,
            labelText: "Wachtwoord",
            hintText: "******"
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: textFormField(
            controller: _passwordConfirmationTextController,
            labelText: "Herhaal wachtwoord",
            hintText: "******"
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: Row(
          children: [
            Expanded(child: textFormField(
                controller: _firstNameTextController,
                labelText: "Voornaam",
                hintText: "bv. Lennard"
            )),
            SizedBox(width: 10),
            Expanded(child: textFormField(
                controller: _lastNameTextController,
                labelText: "Achternaam",
                hintText: "bv. Deurman"
            ))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: multiLineTextField(
            controller: _bioTextController,
            labelText: "Over mij",
            hintText: "Vertel wat over jezelf..."
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(
              vertical: 20
          ),
          child: submitButton(labelText: "Inschrijven")
      )
    ];
  }

}