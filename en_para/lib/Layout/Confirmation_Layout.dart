import 'package:flutter/material.dart';
//import 'package:mailer/mailer.dart';
import 'Side_Menu.dart';
import '../Money_transfer.dart';
import 'App_Bar.dart';


class Confirmation_Layout extends StatelessWidget{

  /*
  var emailTransport;
  var envelope;
  */
  Widget _Container(Color color , BuildContext context){
    return new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
            color: color,
            width: 2.0
        ),
      ),
      width: MediaQuery.of(context).size.width / 4,
    );

  }

  Widget buttomButton(String text , IconData icon , VoidCallback fn , BuildContext context){
    return new Container(
      color: Colors.grey ,
      height: 50.0,
      width:  MediaQuery.of(context).size.width / 2 ,
      child: new InkWell(
          onTap: () => fn(),
          child: new Row(
            children: <Widget>[
              new Icon(icon , size: 30.0,),
              new Expanded(
                  child: new Text(text,
                    style: new TextStyle(fontSize: 12.0),
                  )
              )
            ],
          )
      ),
    );
  }


  void SendEmail(){

   /* this.emailTransport.send(this.envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
        */
   print("We gonna send Mail do not worry!!");

  }

  @override
  Widget build(BuildContext context) {

    /*
    //mail part
    var mail_options = new HotmailSmtpOptions()
    ..username = "bjk-burak96@hotmail.com"
    ..password = "berkan2005";

    emailTransport = new SmtpTransport(mail_options);

    //create mail.
    envelope = new Envelope()
      ..from = 'bjk-burak96@hotmail.com'
      ..recipients.add('burakakten.ba@gmail.com')
      ..subject = 'Testing the Dart Mailer library 語'
      ..text = 'This is a cool email message. Whats up? 語';
    */

    return new Material(
      child: new Scaffold(
        drawer: new Side_Menu(),
        appBar: new App_Bar("Para Transferi").showBar(),
        body: new Column(
          children: <Widget>[
            new Row( //colorful upper line
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _Container(Colors.deepPurple , context),
                _Container(Colors.orange , context),
                _Container(Colors.lightGreen[500] , context),
                _Container(Colors.blue[200] , context),
              ],
            ),
            new Container(
              padding: new EdgeInsets.only(top: 20.0 , left: 20.0) ,
              alignment: Alignment.topLeft,
              child: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(Icons.done , color: Colors.white, size: 40.0,),
                radius: 25.0,
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            new Container(
                alignment: Alignment.topLeft,
                padding: new EdgeInsets.only(left: 20.0) ,
                child: new Text("Para transferiniz başarıyla gerçekleştirildi.")
            ),
            /*new Container(
                alignment: Alignment.topLeft,
                padding: new EdgeInsets.only(left: 20.0) ,
                child: new Text("Some  other text here!-Some  other text here!-Some  other text here!-Some  other text here!-Some  other text here!")
            ),*/
            new Expanded(
              child: new Container(
                alignment: Alignment.bottomRight,
                child: new CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: new Icon(Icons.done ,color:Colors.white, size: 180.0,),
                  radius: 100.0,
                ),
              ),
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  buttomButton("Transfer hakkında ücretsiz bilgilendir",
                      Icons.mail_outline ,
                      SendEmail ,
                      context
                  ),
                  buttomButton("Yeni bir data transferi yap",
                      Icons.replay,
                      () {
                        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                            builder:(context) => new Money_transfer()), (Route<dynamic> route) => false);//might be change
                      },
                      context
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}