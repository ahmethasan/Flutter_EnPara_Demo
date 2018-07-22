import 'package:flutter/material.dart';
import './Money_transfer.dart';

void main(){

  try{
    runApp(
      new MaterialApp(
        title: "En Para",
        home: new Money_transfer(),
      ),
    );
  }catch(e){
    debugPrint(e);
    print(e.toString());
  }
}