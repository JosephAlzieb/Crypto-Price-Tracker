import 'package:flutter/material.dart';


BoxShadow getBoxShadow (Color color, Offset offset){
  return BoxShadow(
    color: color,
    offset: offset,
    blurRadius: 10,
    spreadRadius: 1,
  );
}