import 'package:flutter/material.dart';

const Color customBlue = Color.fromRGBO(47, 59, 109, 1);

Color dateColor({String? date}) {
  switch (date) {
    case 'yesterday':
      return Colors.blueAccent;
    case 'today':
      return Colors.pink;
    default:
      return customBlue;
  }
}
