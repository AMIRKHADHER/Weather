import 'package:flutter/material.dart';

class Mapper {
  static String convertImage(String value) {
    switch (value) {
      case '01d':
        return "http://openweathermap.org/img/wn/01d@2x.png";
      case '02d':
        return "http://openweathermap.org/img/wn/02d@2x.png";
      case '03d':
        return "http://openweathermap.org/img/wn/03d@2x.png";
      case '04d':
        return "http://openweathermap.org/img/wn/04d@2x.png";
      case '09d':
        return "http://openweathermap.org/img/wn/09d@2x.png";
      case '10d':
        return "http://openweathermap.org/img/wn/10d@2x.png";
      case '11d':
        return "http://openweathermap.org/img/wn/11d@2x.png";
      case '13d':
        return "http://openweathermap.org/img/wn/13d@2x.png";
      case '50d':
        return "http://openweathermap.org/img/wn/50d@2x.png";
      case '01n':
        return "http://openweathermap.org/img/wn/01n@2x.png";
      case '02n':
        return "http://openweathermap.org/img/wn/02n@2x.png";
      case '03n':
        return "http://openweathermap.org/img/wn/03n@2x.png";
      case '04n':
        return "http://openweathermap.org/img/wn/10d@2x.png";
      case '09n':
        return "http://openweathermap.org/img/wn/04n@2x.png";
      case '10n':
        return "http://openweathermap.org/img/wn/09n@2x.png";
      case '11n':
        return "http://openweathermap.org/img/wn/10d@2x.png";
      case '13n':
        return "http://openweathermap.org/img/wn/11n@2x.png";
      case '50n':
        return "http://openweathermap.org/img/wn/50n@2x.png";
      default:
        return "http://openweathermap.org/img/wn/10d@2x.png";
    }
  }
}
