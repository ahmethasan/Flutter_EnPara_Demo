import 'package:flutter/material.dart';


class Top_Header extends StatelessWidget{

  var _text;
  var _context;
  Top_Header(this._text , this._context);


  Widget _Container(Color color){
    return new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
            color: color,
            width: 2.0
        ),
      ),
      width: MediaQuery.of(this._context).size.width / 4,
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row( //colorful upper line
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _Container(Colors.deepPurple),
            _Container(Colors.orange),
            _Container(Colors.lightGreen[500]),
            _Container(Colors.blue[200]),
          ],
        ),
        new Container(
          padding: new EdgeInsets.only(top: 10.0 , bottom: 10.0),
          alignment: Alignment.center,
          color: Colors.lightGreen[500], // title
          child: new Text(_text,
            style: new TextStyle(
                color: Colors.white ,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }

}