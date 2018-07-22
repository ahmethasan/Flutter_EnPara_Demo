import 'package:flutter/material.dart';

class App_Bar{

  var _title;
  App_Bar(this._title);

  showBar() {
    return new AppBar(
      backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.black45) ,
      title: new Text(this._title ,
        style: new TextStyle(
            color: Colors.black45 ,
            fontSize: 20.0 ,
            fontWeight: FontWeight.normal
        ),
      ),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.exit_to_app ,size: 30.0,),
            onPressed: null
        ),
      ],
    );
  }
}