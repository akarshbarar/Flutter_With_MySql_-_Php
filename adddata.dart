import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController  cuid=new TextEditingController();
  TextEditingController  cname=new TextEditingController();
  TextEditingController  cemail=new TextEditingController();
  TextEditingController  cmobile=new TextEditingController();
  TextEditingController  cpassword=new TextEditingController();

  void addData(){

    var url="http://<YOUR_IP>/dashboard/Ripozo/adddata.php";
    http.post(url,body: {
      "uid":cuid.text,
      "name":cname.text,
      "mobile":cmobile.text,
      "email":cemail.text,
      "password":cpassword.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Add Data"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(1.0),
        child:ListView(
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
                  addData();
                  Navigator.of(context).pop();
                },
                  child: new Text("Add Data"),
                  color: Colors.deepOrange,
                )

              ],
            ),
          ],
        ),
      )
    );
  }
}
