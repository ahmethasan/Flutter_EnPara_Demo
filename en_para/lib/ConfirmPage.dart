import 'package:flutter/material.dart';
import './Layout/Top_Header.dart';
import './Layout/Confirmation_Layout.dart';
import './Layout/Side_Menu.dart';
import './Layout/App_Bar.dart';



class ConfirmPage extends StatelessWidget{

  Map<String , String> _transferInfo;
  Map<String , String> _senderInfo;

  ConfirmPage(this._senderInfo , this._transferInfo);

  Widget createHeader(String header){
    return new Container(
      alignment: Alignment.topLeft,
      padding: new EdgeInsets.only(left: 15.0),
      child: new Text(header,
        style: new TextStyle(
            color: Colors.deepPurple ,
            fontWeight: FontWeight.bold ,
            fontSize: 15.0,
        ),
      ),
    );
  }
  
  Widget printInfo(Map<String , String> info){
    var Gline = new Container(
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
    );
    var padding = new Padding(padding: new EdgeInsets.only(top: 3.0));

    return  new Flexible(
      child: new ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: info.keys.length,
        itemBuilder: (context , index) {
          var keys = info.keys;
          return new Container(
            padding: new EdgeInsets.only(left: 20.0 , right: 20.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Expanded(child: new Text(keys.elementAt(index) )),

                    new Text(info[keys.elementAt(index)] ,
                      style: new TextStyle(
                          color: Colors.deepPurple ,
                          fontSize: 13.0
                      ),
                    )
                  ],
                ),
                padding,
                Gline,
                padding,
              ],
            ),
          );
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    var line = new Container(
      height: 2.0,
      color: Colors.deepPurple,
      width: MediaQuery.of(context).size.width,
    );
    var padding = new Padding(padding: new EdgeInsets.only(top: 3.0));
    var padding2 = new Padding(padding: new EdgeInsets.only(top: 10.0));

    return new Material(
      child: new Scaffold(
        drawer: new Side_Menu(),
        appBar: new App_Bar("Para Transferi").showBar(),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Top_Header("Onaylıyor musunuz?" , context),
              ],
            ),
            createHeader("Gönderen Hesap Bilgileri"),
            padding,
            line,
            padding,
            printInfo(_senderInfo),
            createHeader("Alıcı hesap ve işlem bilgileri"),
            padding,
            line,
            padding,
            printInfo(_transferInfo),
            new Padding(padding: new EdgeInsets.only(top: 100.0)),
            new Container(
              color: Colors.deepPurple,
              height: 40.0,
              width: MediaQuery.of(context).size.width  - 30,
              child: new InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                      builder:(context) => new Confirmation_Layout()), (Route<dynamic> route) => false);
                },
                child: new Center(
                  child: new Text("Onayla" ,
                    style: new TextStyle(
                        color: Colors.white ,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            padding2,
            new Container(
              color: Colors.teal,
              height: 40.0,
              width: MediaQuery.of(context).size.width  - 30,
              child: new InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: new Center(
                  child: new Text("Vazgeç" ,
                    style: new TextStyle(
                        color: Colors.white ,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            padding2,
          ],
        ),
      ),
    );
  }
}
