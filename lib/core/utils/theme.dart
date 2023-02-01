import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class AppSizes {}

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFF7F27);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFFA4AFB7);
  static const blue = Color(0xFF161D6F);
}



/*
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(

    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor, 
    

    
    
    ),
    gapPadding: 10,
  );
  return InputDecorationTheme(

    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    fillColor: Colors.black,
    filled: true,
  );
}
*/



AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kPrimaryColor,
    // elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:kPrimaryColor,
      statusBarBrightness:Brightness.light,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 12),
    
   
  );
}




