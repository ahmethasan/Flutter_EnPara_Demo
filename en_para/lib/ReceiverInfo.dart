import 'package:flutter/material.dart';
import './Layout/Top_Header.dart';
import './Layout/Side_Menu.dart';
import './Layout/App_Bar.dart';
import './Money_Account.dart';
import './ConfirmPage.dart';


class ReceiverInfo extends StatefulWidget{

  Money_Account _whichAccount;

  ReceiverInfo(this._whichAccount);

  @override
  State createState() => new _ReceiverInfo();
}

class _ReceiverInfo extends State<ReceiverInfo>{

  //must change
  final _senderIBAN = "TR76 0000 0000 0000 0000 0000 00";
  final _bankName = "QNB FINANSBANK";

  //for taking input and make sth on it
  final _nameController   = new TextEditingController();
  final _IBANController   = new TextEditingController();
  final _moneyController  = new TextEditingController();
  final _interactionController  = new TextEditingController();
  final _explanationController = new TextEditingController();

  List<String> _alertMenu = new List<String>(); // drop down menu

  var _isChecked; // for check box

  var _DropDown_value; // for drop down menu value to control changes

  Map<String , String> _transferInfo ; //for send confirmation
  Map<String , String> _senderAccount ; //for send confirmation


  void sendButton() {

    ///alert dialog ?
    if (//_nameController.text.isNotEmpty && //_IBANController.text.length == 24
        /*&& _moneyController.text != "0.00" && */_DropDown_value != "Seçiniz"
        /*&& _explanationController.text.isNotEmpty*/){

      setState(() {
        DateTime time = new DateTime.now();
        _transferInfo = {
          "Alıcı adı soyadı/unvanı": _nameController.text,
          "Banka": _bankName,
          "Transfer Tarihi": time.day.toString() + "/" + time.month.toString()+
              "/" + time.year.toString(),
          "IBAN": "TR" + _IBANController.text,
          "Tutar": _moneyController.text + widget._whichAccount.getMoneyType(),
          "Transfer Tipi": _DropDown_value,
          "Açıklama": _explanationController.text,
        };
      });

      Navigator.of(context).push(
          new MaterialPageRoute(
              builder:(context) => new ConfirmPage(_senderAccount,_transferInfo)
          )
      );
    }
  }

  void onChecked(bool value){
    setState(() {
      _isChecked = value;
    });
  }

  void dispose() {
    // Clean up the controller when the Widget is disposed
    _nameController.dispose();
    _IBANController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  Widget _createInteractionLay(){

    var resultWidget =
    new Container(
      child: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 15.0)),
          new Container(
            decoration: new BoxDecoration(
                border: new Border.all(color: Colors.grey[400] , width: 1.0)
            ),
            child: new TextField( // for receiver name
              controller: _interactionController,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "    En hızlı işlem adını giriniz."
              ),
            ),
          ),
        ],
      ),
    );

    //put _interactionController into shared preferences.

    return resultWidget;
  }

  @override
  void initState() {
    super.initState();
    _isChecked = false;

    _alertMenu.add("Seçiniz");
    _alertMenu.add("Aidat");
    _alertMenu.add("Bağış");
    _alertMenu.add("Bahis");
    _alertMenu.add("BES");
    _alertMenu.add("Burs");
    _alertMenu.add("Diğer Kira Ödemesi");
    _alertMenu.add("İşyeri Kirası");
    _alertMenu.add("Maaş");
    _alertMenu.add("E-Ticaret");

    _DropDown_value = _alertMenu.elementAt(0);

    _moneyController.text = "0,00 ";
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _interactionController.clear();
  }


  @override
  Widget build(BuildContext context) {

    //must be come from app DB
    _senderAccount = {
      "Gönderen Hesap"  : widget._whichAccount.getAccountType(),
      "IBAN"            : _senderIBAN,
    };

    var style_ = new TextStyle(
        color: Colors.red[800] ,
        fontWeight: FontWeight.bold ,
        fontSize: 15.0
    );

    var moneyType = widget._whichAccount.getMoneyType();

    var padding1 = new Padding(padding: new EdgeInsets.only(top: 5.0));
    var padding2 = new Padding(padding: new EdgeInsets.only(top: 15.0));

    return new Material(
      child: new Scaffold(
        drawer: new Side_Menu(),
        appBar: new App_Bar("Para Transferi").showBar(),
        body: new Column(
          children: <Widget>[
            new Top_Header("Transfer detayları" , context),
            new Expanded(
              child: new ListView(
                padding: new EdgeInsets.only(left: 15.0 , right: 15.0) ,
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(top: 20.0)),
                  new Row(
                    children: <Widget>[
                      new Text("Gönderen Hesap " , style: style_),
                      new Padding(padding: new EdgeInsets.only(left: 2.0),),
                      new InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              //title: new Text("Title"),
                              content: new Text(widget._whichAccount.toString() ,
                                style: new TextStyle(
                                  color: Colors.black54 ,
                                  fontSize: 14.0 ,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          );
                        },
                        child: new CircleAvatar(
                          radius: 11.0,
                          backgroundColor: Colors.grey,
                          child: new Container(
                            child: new Text("?" ,
                              style:new TextStyle(
                                  color: Colors.white ,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  padding1,
                  new Text(widget._whichAccount.toString() ,
                      style: new TextStyle(color: Colors.blue , fontSize: 15.0 , fontWeight: FontWeight.bold),
                  ),
                  padding1,
                  new Container(
                    height: 1.0,
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.grey[100],
                          Colors.grey[300],
                          Colors.grey[100]
                        ]
                      )
                    ),
                  ),
                  padding2,
                  new Text("Alıcı adı soyadı/unvanı" , style: style_),
                  new Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.grey[400] , width: 1.0)
                    ),
                    child: new TextField( // for receiver name
                      controller: _nameController,
                      decoration: new InputDecoration(
                        border: InputBorder.none
                      ),
                      //onChanged: (text) => print(text.toString()),
                    ),
                  ),
                  padding2,
                  new Text("IBAN" , style: style_),
                  new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.grey[400] ,
                            width: 1.0)
                    ),
                    child: new Row(
                      children: <Widget>[
                        new Text("TR" , style: new TextStyle(fontSize: 16.0),),
                        new Expanded(
                          child: new TextField( // for receiver name
                            controller: _IBANController,
                            /*onChanged: (iban){

                              iban = iban.replaceAll(new RegExp(r"\s+\b|\b\s"), "");

                              _ibanSize = iban.length + 2;

                              if(_IBANController.text.endsWith(" ") && _ibanSize % 4 == 0)
                                _IBANController.text = _IBANController.text.substring(0 ,_IBANController.text.length - 1 );
                              else if (_ibanSize % 4 == 0)
                                _IBANController.text += " ";
                            },*/
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  padding2,
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child:new Text("Tutar" , style: style_, textAlign: TextAlign.start,),
                      ),
                      new InkWell(
                        child: new Container(
                          decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.black45))),
                          child: new Text("Tüm bakiye" ,
                            textAlign: TextAlign.end,
                            style: new TextStyle(color: Colors.grey ,fontSize: 12.0 , fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          _moneyController.text = widget._whichAccount.getMoneyAmount() +" ";
                        },
                      ),

                    ],
                  ), // TUTAR
                  new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.grey[400] ,
                            width: 1.0
                        )
                    ),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(child: new TextField( // for receiver name
                          controller: _moneyController,
                          onChanged: (money) {

                            /*_money_len++;
                            _money_len % 3 == 0 ? _moneyController.text+="." : true;*/
                          },
                          textAlign: TextAlign.right,
                          //to control of '.' and ',' we can use set state
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                          ),
                        )),
                        new Text(moneyType.toString())
                      ],
                    ),
                  ),
                  padding2,
                  new Text("Transfer Tipi" , style: style_),
                  new Container(
                    decoration: new BoxDecoration(
                        //color: Colors.grey[200],
                        border: new Border.all(color: Colors.grey[400] , width: 1.0),
                        gradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1,0.3,0.5,0.7],
                          colors: [
                            Colors.grey[100],
                            Colors.grey[200],
                            Colors.grey[200],
                            Colors.grey[300]
                          ]
                        )
                    ),
                    child: new ListTile(
                      trailing: new Icon(Icons.keyboard_arrow_down),
                      title:  new DropdownButton<String>(
                        iconSize: 0.0,
                        hint: new Text(_DropDown_value),
                        onChanged: (value) {
                          setState(() {
                            _DropDown_value = value;
                          });
                        },
                        items: _alertMenu.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  padding2,
                  new Text("Açıklama" , style: style_),
                  new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.grey[400] , width: 1.0),
                    ),
                    height: 130.0,
                    child: new TextField(
                      controller: _explanationController,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  padding2,
                  new Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.grey[400] ,
                            width: 1.0)
                    ),
                    height: 50.0,
                    child: new CheckboxListTile(
                      title: new Text("En hızlı etkileşimlere ekle" ,
                        style: new TextStyle(fontSize: 14.0),),

                      value: _isChecked,
                      onChanged: (bool value){
                        onChecked(value);
                      }),
                  ),
                  _isChecked == true ? _createInteractionLay()
                      : new Padding(padding: new EdgeInsets.only(top: 1.0)),
                  padding2,
                  new Container(
                    color: Colors.deepPurple,
                    height: 40.0,
                    child: new InkWell(
                      onTap: () {
                        sendButton();
                      },
                      child: new Center(
                        child: new Text("Gönder" ,
                          style: new TextStyle(
                              color: Colors.white ,
                              fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }




}