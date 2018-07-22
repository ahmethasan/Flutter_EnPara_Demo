import 'package:flutter/material.dart';



class Side_Menu extends StatelessWidget{

  // ToDo:This is abstract implement so implement here according to original one
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Container(
        color: Colors.greenAccent,
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new ListTile(
                title: new Text("This is header"),
                subtitle: new Text("Hello"),
                trailing: new Icon(Icons.home),
                leading: new Icon(Icons.insert_emoticon),
                onTap: () {
                  Navigator.pop(context);
                }
              ),
            ),
            new ListTile(
              title: new Text("item 1"),
              trailing: new Icon(Icons.done),
            ),
            new ListTile(
              title: new Text("item 2"),
              trailing: new Icon(Icons.replay),

            ),
            new ListTile(
              title: new Text("item 3"),
              trailing: new Icon(Icons.exit_to_app),

            ),
            new ListTile(
              title: new Text("item 4"),
              trailing: new Icon(Icons.language),

            ),
            new ListTile(
              title: new Text("item 5"),
              trailing: new Icon(Icons.vertical_align_center),

            ),
            new ListTile(
              title: new Text("item 6"),
              trailing: new Icon(Icons.delete),

            ),
            new ListTile(
              title: new Text("item 7"),
              trailing: new Icon(Icons.done),
            ),
            new ListTile(
              title: new Text("item 8"),
              trailing: new Icon(Icons.replay),

            ),
            new ListTile(
              title: new Text("item 9"),
              trailing: new Icon(Icons.exit_to_app),

            ),
            new ListTile(
              title: new Text("item 10"),
              trailing: new Icon(Icons.language),

            ),
            new ListTile(
              title: new Text("item 11"),
              trailing: new Icon(Icons.vertical_align_center),

            ),
            new ListTile(
              title: new Text("item 12"),
              trailing: new Icon(Icons.delete),
            ),
            new ListTile(
              title: new Text("item 13"),
              trailing: new Icon(Icons.done),
            ),
            new ListTile(
              title: new Text("item 14"),
              trailing: new Icon(Icons.replay),

            ),
            new ListTile(
              title: new Text("item 15"),
              trailing: new Icon(Icons.exit_to_app),

            ),
            new ListTile(
              title: new Text("item 16"),
              trailing: new Icon(Icons.language),

            ),
            new ListTile(
              title: new Text("item 17"),
              trailing: new Icon(Icons.vertical_align_center),

            ),
            new ListTile(
              title: new Text("item 18"),
              trailing: new Icon(Icons.delete),

            ),
          ],
        ),

      )
    );
  }



}