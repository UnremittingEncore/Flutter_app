import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/ListViewDemonstration.dart';

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
      body: Center(
        child: Text('You are in Page 2'),
      ),
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
        child: Text('You are in Page 3'),
      ),
    );
  }
}