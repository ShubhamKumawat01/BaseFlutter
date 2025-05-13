import 'package:day/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget{
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      :assert(catalog!=null),
        super(key:key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:
      Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder(),),
              ),
              child: "Buy".text.white.make(),
            ).wh(100,50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(//for image animation
                tag: Key(catalog.id.toString()),
                child: Image.network(
                    catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.
                        color(MyTheme.darkBluishColor).
                        bold.
                        make(),
                        catalog.desc.text.textStyle(context.captionStyle).make(),
                        10.heightBox,
                      ],
                    ).py64(),
                              ),
                ),
            )
          ],
        ),
      ),//for top padding
    );
  }
}