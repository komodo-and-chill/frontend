import 'package:flutter/material.dart';
import 'tabsmain.dart';
import 'lefttab.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin{
  TabController controller;

  @override
  void initState(){
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(check());
    return Scaffold(
      body: getTabBarView(<Widget>[Left(), MainTab()]
      ),
      bottomNavigationBar: Material(
        color: Colors.blueGrey,
        child: getTabBar(),
      ),
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      children: tabs,
      controller: controller,
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab> [
        Tab(
          icon: Icon(Icons.search)
        ),
        Tab(
          icon: Icon(Icons.create)
        ),
      ],
      controller: controller,
    );
  }
}
