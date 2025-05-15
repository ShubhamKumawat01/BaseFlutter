
import 'package:day/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({required
  Key key, required this.catalog,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return VxBuilder<MyStore>(
      mutations: {AddMutation,RemoveMutation},
      builder: (context, store, status) {
        final bool isInCart = _cart.items.contains(catalog);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(
                  catalog); // This will rebuild the widget via VxBuilder
            }
          },
          style: ButtonStyle(
            backgroundColor:
            WidgetStateProperty.all(MyTheme.darkBluishColor),
            shape: WidgetStateProperty.all(StadiumBorder()),
          ),
          child: isInCart
              ? Icon(Icons.done, color: Colors.white)
              : Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
        );
      },
    );
  }
}