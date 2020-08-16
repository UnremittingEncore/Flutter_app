import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/Products.dart';

class ShoppingListTile extends StatefulWidget{
  final Products products;


  ShoppingListTile(this.products);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoppingListTileState(products: products);
  }

}

class ShoppingListTileState extends State<ShoppingListTile>{
  final Products products;


  ShoppingListTileState({this.products});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Image(image:  AssetImage(products.productIcon),),
      ),
      title: Row(
        children:<Widget> [
          Expanded(child: Text(products.name),),
          Checkbox(value: products.isChecked, onChanged: (bool value){
            setState(() {
                products.isChecked = value;
            });
          },),
        ],
      ),
    );
  }

}