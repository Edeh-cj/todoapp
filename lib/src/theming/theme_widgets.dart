import 'package:flutter/material.dart';

Widget themeTile(Color color, String name, [VoidCallback? callback]){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: GestureDetector(
      onTap: callback,
      child: Card(
        color: color,
        child: Center(child: Text(name, style: const TextStyle(color: Colors.white),)),
      ),
    ),
  );
}