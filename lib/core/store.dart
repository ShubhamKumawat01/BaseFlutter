import 'package:day/models/cart.dart';
import 'package:day/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  CatalogModel catalog=CatalogModel();
  CartModel cart=CartModel();


MyStore(){
  catalog=CatalogModel();
  cart=CartModel();
  cart.catalog=catalog;
  }
}