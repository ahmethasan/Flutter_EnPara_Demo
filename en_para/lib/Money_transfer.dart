import 'package:flutter/material.dart';
import './Layout/Top_Header.dart';
import './Layout/Side_Menu.dart';
import './Layout/App_Bar.dart';
import './Money_Account.dart';
import './ReceiverInfo.dart';

class Money_transfer extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _Money_Transfer();
}

class _Money_Transfer extends State<Money_transfer>{


  List<Money_Account> _clientAccount;


  void handleChosenAccount(Money_Account account){
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => new ReceiverInfo(account))
    );

  }

  @override
  void initState() {
    super.initState();
    _clientAccount = new List<Money_Account>();
    _clientAccount.add(new Money_Account("Vadesiz TL", "TL", "370,00"));
    _clientAccount.add(new Money_Account("Vadesiz USD", "USD", "940,26"));
    _clientAccount.add(new Money_Account("Vadesiz EUR", "EUR", "1.328,98"));
    _clientAccount.add(new Money_Account("Enpara.com kredi kartı", "TL", "2.274,78"));

    _clientAccount.add(new Money_Account("Vadesiz TL", "TL", "370,00"));
    _clientAccount.add(new Money_Account("Vadesiz USD", "USD", "940,26"));
    _clientAccount.add(new Money_Account("Vadesiz EUR", "EUR", "1.328,98"));
    _clientAccount.add(new Money_Account("Enpara.com kredi kartı", "TL", "2.274,78"));

    _clientAccount.add(new Money_Account("Vadesiz TL", "TL", "370,00"));
    _clientAccount.add(new Money_Account("Vadesiz USD", "USD", "940,26"));
    _clientAccount.add(new Money_Account("Vadesiz EUR", "EUR", "1.328,98"));
    _clientAccount.add(new Money_Account("Enpara.com kredi kartı", "TL", "2.274,78"));
  }
  
  @override
  Widget build(BuildContext context) {

    var padding = new Padding(padding: new EdgeInsets.only(top: 20.0));

    return new Scaffold(
      drawer: new Side_Menu(),
      appBar: new App_Bar("Para Transferi").showBar(),
      body: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Top_Header("Gönderen seçimi" , context),
            padding,
            new Container(
              decoration: new BoxDecoration(
                  color:Colors.grey[300],
                  border: new Border.all(
                      color: Colors.grey[350] ,
                      width: 1.5) ),
              width: MediaQuery.of(context).size.width - 40.0,
              height: 50.0,
              child: new Center(
                child: new ListTile(
                  onTap: () => print("Do someting"),
                  title: new Text("En Hızlı işlemleri getir",
                    style: new TextStyle(
                        color: Colors.black54 ,
                        fontSize: 14.0),),

                  trailing: new Icon(Icons.keyboard_arrow_down , size: 30.0,),
                  leading: new Icon(Icons.mail_outline),
                ),
              ),
            ),
            padding,
            new Expanded(//accounts parts
              child: new Container(
                child: new Center(
                  child: new ListView.builder(
                    primary: false,
                    itemCount: _clientAccount.length,
                    itemBuilder: (context , index){
                      return new Container(
                        decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            border:new Border(
                                top: new BorderSide(
                                    color: Colors.grey[500] ,
                                    width: 0.5
                                )
                            )
                        ),
                        child: new ListTile(
                            title:  _clientAccount.elementAt(index).toWidget(),
                            trailing: new Icon(
                              Icons.chevron_right ,
                              color: Colors.grey[400],
                            ),

                            onTap: () => handleChosenAccount(_clientAccount.elementAt(index))
                        ),
                      );
                    }
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
