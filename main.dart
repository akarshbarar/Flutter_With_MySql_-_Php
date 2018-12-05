import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ripozo/adddata.dart';
import 'package:ripozo/deatils.dart';

void main()=>runApp(new MaterialApp(
  title: "My Store",
  home: new Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}
class HomeState extends State<Home>{

  Future<List> getData() async{

  final response=await http.get("http://192.168.43.13/dashboard/Ripozo/getdata.php");
  return json.decode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Store"),
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context)=>new AddData(),
            ),
          ),
          child: new Icon(Icons.add),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError)
            print(snapshot.error);
          return snapshot.hasData
              ?new ItemList(list: snapshot.data,)
              :new Center(
                child: new CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}
class ItemList extends StatelessWidget{

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list==null?0:list.length,
      itemBuilder: (context,i){
          return new ListTile(
            title: new Text(list[i]['name']),
            subtitle: new Text(list[i]['email']),
            leading: new Icon(Icons.http),
            onTap:()=> Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context)=>new Details(list: list,index: i),

              )
            ),
          );
      },
    );
  }
}