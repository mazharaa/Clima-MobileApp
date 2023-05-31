import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    ),
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(
      Icons.search,
      color: Colors.grey,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(color: Colors.grey)
);