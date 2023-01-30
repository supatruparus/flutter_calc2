import 'package:flutter/material.dart';

TextStyle inputStyle = const TextStyle(
    fontFamily: 'Changa',
    height: 1,
    fontSize: 48,
    /*backgroundColor: Colors.green,*/ overflow: TextOverflow.clip);

BoxDecoration circButton = BoxDecoration(
    color: Colors.grey,
    gradient: const LinearGradient(
        colors: [Color.fromRGBO(123, 123, 123, 1), Color.fromRGBO(170, 170, 170, 1)]),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.40), offset: const Offset(-8, 4), blurRadius: 10)
    ],
    borderRadius: const BorderRadius.all(Radius.circular(50)));

Color backgroundColor = const Color.fromRGBO(36, 36, 36, 1);

const TextStyle buttonsText = TextStyle(
  fontFamily: 'Changa',
  // fontSize: 36,
  color: Colors.black,
);

const TextStyle resultText = TextStyle(
    fontFamily: 'Changa',
    fontSize: 56,
    height: 1,
    shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]);
