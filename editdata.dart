import 'package:flutter/material.dart';
import 'package:ripozo/main.dart';
import 'deatils.dart';

import 'package:http/http.dart' as http;
class EditData extends StatefulWidget {
  final List list;
  final int index;


  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {


  TextEditingController  cuid;
  TextEditingController  cname;
  TextEditingController  cemail;
  TextEditingController  cmobile;
  TextEditingController  cpassword;
  void editData() {

    var url="http://192.168.43.13/dashboard/Ripozo/editdata.php";

    http.post(url,body:{
      "uid":cuid.text,
      "name":widget.list[widget.index]['name'],
      "mobile":cmobile.text,
      "email":cemail.text,
      "password":cpassword.text

    });

  }
    @override
    void initState(){
      cuid=new TextEditingController(text: widget.list[widget.index]['uid']);
      cname=new TextEditingController(text: widget.list[widget.index]['name']);
      cemail=new TextEditingController(text: widget.list[widget.index]['email']);
      cmobile=new TextEditingController(text: widget.list[widget.index]['mobile']);
      cpassword=new TextEditingController(text: widget.list[widget.index]['password']);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("EDIT DATA"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: cuid,
                  decoration: new InputDecoration(
                    hintText: "UID",
                    labelText: "UID",
                  ),
                ),
                new TextField(
                  controller: cname,
                  decoration: new InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                  ),
                ),
                new TextField(
                  controller: cemail,
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: cmobile,
                  decoration: new InputDecoration(
                    hintText: "Mobile",
                    labelText: "Mobile",
                  ),
                ),
                new TextField(
                  controller: cpassword,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(onPressed: (){
                  editData();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context)=>new Home()
                    ),
                  );
                },
                  child: new Text("EDIT  Data"),
                  color: Colors.deepOrange,
                )

              ],
            ),
          ],
        ),
      ),

    );
  }
}
