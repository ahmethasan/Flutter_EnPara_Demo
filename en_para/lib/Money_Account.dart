// can be package
import 'package:flutter/material.dart';

class Money_Account{

  String _account_type;
  String _money_type;
  String _money_amount;

  Money_Account(this._account_type , this._money_type , this._money_amount);

  String getMoneyType() => this._money_type;

  String getAccountType() => this._account_type;

  String getMoneyAmount() => this._money_amount;

  Widget toWidget(){
    var style =  new TextStyle(fontSize: 13.3 , color: Colors.black54);
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Text(_account_type , textAlign: TextAlign.start, style: style,),
        ),
        new Expanded(
          child: new Text(_money_amount , textAlign: TextAlign.end,  style: style,),
        ),
        new Text(" " + _money_type , style: style,),
      ],
    );
  }

  @override
  String toString() {
    return _account_type + "/" + _money_amount + " " + _money_type;
  }
}