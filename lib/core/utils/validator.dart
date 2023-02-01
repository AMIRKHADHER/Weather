import 'package:flutter/material.dart';
class Validator {
  static BuildContext? myContext;


  static String? validateEmail(String value){

    if (!value.contains('@')) {
      return "veuillez saisir votre adresse e-mail";

    }
    return null;
  }

  static String? validatePassword(String value){

    if (value.length < 4) {
      return "veuillez saisir votre mot de passe";
    }
    return null;
  }
}
