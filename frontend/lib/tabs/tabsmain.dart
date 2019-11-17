import 'package:flutter/material.dart';

class MainTab extends StatefulWidget {
  MainTabState createState() => MainTabState();
}

class MainTabState extends State<MainTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,            
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          top: 455,
            child:CurvedListItem(
            color1: Colors.black54,
            title: "Test4",
            time: "TODAY TestTime"
            )),
        Positioned(
          top:265.0,
            child:CurvedListItem(
              color1: Colors.purpleAccent,
              title: "Test3",
              time: "TODAY TestTime"
              )),
        Positioned(
          top:75.0,
            child:CurvedListItem(
              color1: Colors.pinkAccent,
              title: "Test2",
              time: "TODAY TestTime"
              )),
          Positioned(
            child:Container(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tasks', style: TextStyle(fontSize: 60.0),),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(75)),
              ),
            ),
          ),
      ],
    ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  
  final String title;
  final String time;
  final IconData icon;
  final Color color1;
  final Color color2;
  final Color nextColor;

  CurvedListItem({this.title, this.time, this.icon, this.color1, this.color2, this.nextColor });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(null),
      onDismissed:(direction){},
      child: Container(
        height: 265.0,
        width: 395.0,
        decoration: BoxDecoration(
          color: this.color1,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(80.0),
          ),
        ),
        padding: EdgeInsets.only(
          left: 32,
          top: 100.0,
          bottom: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(height: 2),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
              ),
              Row(),
          ],
          )
      ),
    );
  }
}