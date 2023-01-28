import 'package:flutter/material.dart';

const BoxDecoration squareButton =   BoxDecoration(

    color: Colors.black54, borderRadius: BorderRadius.all(Radius.circular(5)));



 BoxDecoration circButton =  BoxDecoration(
   color: Colors.grey,
    gradient: const LinearGradient(colors: [Color.fromRGBO(123, 123, 123, 1), Color.fromRGBO(170, 170, 170, 1)]),
    boxShadow: [BoxShadow(color:Colors.black.withOpacity(0.25) )],
    borderRadius: BorderRadius.all(Radius.circular(25)));