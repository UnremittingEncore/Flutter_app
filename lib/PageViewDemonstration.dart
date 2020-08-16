import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/ListViewDemonstration.dart';
import 'package:calculator_app/Products.dart';

import 'ArrayDemonstration.dart';
import 'ShoppingListDemonstration.dart';

class PageViewDemonstration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageViewDemoState();
  }

}

class PageViewDemoState extends State<PageViewDemonstration>{
  PageController pageController = new PageController(
      initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      controller: pageController,
      children: [
        Page1(),
        Page2(),
        Page3(),
      ],
    );
  }

}


class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Page 1'),),
      body: Center(
        child: ListViewDemonstration(),
      ),
    );
  }
}



class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'),),
      body: ShoppingListDemonstration(productsList:[
        new Products('Clothes', 'assets/person.png', false),
        new Products('Electronics', 'assets/person.png', false),
        new Products('Groceries','assets/person.png', true),
        new Products('Snack', 'assets/person.png', false),
        new Products('Watches', 'assets/person.png', false),
        new Products('Dish Antenas', 'assets/person.png', false),
        new Products('Televisions', 'assets/person.png', false),
        new Products('Food', 'assets/person.png', false),
      ]),
    );
  }
}



class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Page 3'),),
      body: Center(
        child: ArrayDemonstration(),
      ),
    );
  }
}