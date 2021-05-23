import 'dart:math';

import 'package:flutter/material.dart';

class BMI_Calculator{
  BMI_Calculator({this.cheight,this.cweight});

  final double cweight;
  final double cheight;
  double _bmi;

  String calculateBMI(){
    _bmi = cweight/(pow(cheight/100,2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25) return 'Overweight';
    else if(_bmi>=18.6) return 'Normal';
    else return 'Underweight';
  }

  String getAdvise(){
    if(_bmi>=25) return 'You have higher weight than normal.\nYou should exercise more';
    else if(_bmi>=18.6) return 'You have a normal body weight.\n Good job!!';
    else return 'Your weight is less than normal.\nYou should eat more';
  }




}