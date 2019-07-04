import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(new MaterialApp(
      title: 'Contador de Pessoas',
      home: Home()
  ));

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _msg = "Pode Entrar!";

  void _changePeople( int n){
    setState(() {
      if(_people < 20){
        _people += n;
      } else if( n < 0){
        _people += n;
      }
    });
  }
  void _stateRestaurant(int n){
    if(n<0) {
      setState(() {
        _msg = "Como tem menos gente? ";
      });
    }else if((n>=15) && (n<20)){
      _msg = "Quase lotado!";
    }else if(n>=20){
      _msg = "Restaurante já está lotado!";
    }else{
      _msg = "Pode entrar!";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people" ,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                      _stateRestaurant(_people);
                      debugPrint("$_people");
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: () {
                      _changePeople(1);
                      _stateRestaurant(_people);
                      debugPrint("$_people");
                    },
                  ),
                ),
              ],
            ),
            Text( _msg,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0)),
          ],
        ),
      ],
    );
  }
}
