import 'package:day/models/catalog.dart';
import 'package:day/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;

  final String name="ITRES";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJason=await rootBundle.loadString("assets/files/catalog.json");
    final decodeData=jsonDecode(catalogJason);
    var productsData=decodeData["products"];
    CatalogModel.items=List.from(productsData)
        .map<Item>((item)=>Item.fromMap(item))
        .toList();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                )
            ],
          ),
        ),
      )
    );
  }
}



