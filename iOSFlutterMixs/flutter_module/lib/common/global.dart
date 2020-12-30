import 'package:flutter/material.dart';

class Global {
  static Global instance = Global();
  Color MainColor() {
    return Color.fromRGBO(100, 200, 200, 1.0);
  }
}

const MainColor = Color.fromRGBO(100, 200, 200, 1.0);
const White_color = Color.fromRGBO(0, 0, 0, 1);