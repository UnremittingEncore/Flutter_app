import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:calculator_app/Products.dart';
import 'package:calculator_app/ShoppingListTile.dart';

class ShoppingListDemonstration extends StatefulWidget{
  List<Products> productsList;


  ShoppingListDemonstration({this.productsList});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoppingListState();
  }

}

class ShoppingListState extends State<ShoppingListDemonstration>{
  String TAG = "ShoppingList";
  Logger logger = new Logger();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
            Expanded(
              child: ListView(
                children: widget.productsList.map((Products currentProduct){
                    // Making the list tile
                    return ShoppingListTile(currentProduct);
                }).toList(),
              ),
            ),
            RaisedButton(
              child: Text('Show Selected Items'),
              onPressed: (){
                  for(Products selectedProduct in widget.productsList){
                    if(selectedProduct.isChecked){
                        logger.d(TAG , "Product Selected "+ selectedProduct.name);
                    }
                  }
              },
            )
        ],
      ),
    );
  }

}