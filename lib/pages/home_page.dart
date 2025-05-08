import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  final int days=30;
  final String name="ITRES";

  @override
  Widget build(BuildContext context){
    return Scaffold(// over all root widget head body footer create the ui
        appBar: AppBar(
          title: Text("Days App"),
        ),
         body: Center(
              child: Container(
                child: Text("Welcome to $days days of flutter by $name"),
              ),
          ),
        drawer: Drawer(),
    );
  }
}