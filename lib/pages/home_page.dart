import 'package:day/models/cart.dart';
import 'package:day/models/catalog.dart';
import 'package:day/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import '../utils/routes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;
  final String name="ITRES";
  final url="https://api.jsonbin.io/v3/qs/6826d5478561e97a5014e515";
  //final url="https://nikhilraghuwanshi.in/flutterecommerseappdataapi";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    //final catalogJason=await rootBundle.loadString("assets/files/catalog.json");
    final response= await http.get(Uri.parse(url));//get data from api
    final catalogJason=response.body;
    final decodeData=jsonDecode(catalogJason);
   // var productsData=decodeData["products"];
    var productsData=decodeData["record"]["products"];
    CatalogModel.items=List.from(productsData)
        .map<Item>((item)=>Item.fromMap(item))
        .toList();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(ctx, store,_)=> FloatingActionButton(// for floating button to cart
          onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart,color: MyTheme.creamColor),
        ).badge(color: Vx.red500,size: 22,count: _cart.items.length,textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        )),
      ),
      body:SafeArea(
        child: Container(
          padding: Vx.m16,
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



