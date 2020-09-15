import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'timerUI.dart';
import '../../app_bar.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';



class WalkDetail extends StatelessWidget {
  IconData icon;
  String heading;
  int color;

  WalkDetail(IconData icon, String heading, int color) {
    this.icon = icon;
    this.heading = heading;
    this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Walk(),
    );
  }
}

class Walk extends StatefulWidget {
  Walk({Key key}) : super(key:key);
  @override
  _WalkState createState() => _WalkState();
}

class _WalkState extends State<Walk> with TickerProviderStateMixin{

  MotionTabController _tabController;
  int hour = 0; 
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = "";
  bool checkTimer = true;
  Stopwatch stopwatch = new Stopwatch();


@override
  void initState(){
    super.initState();
    _tabController = MotionTabController(initialIndex:0, vsync: this);
  }

@override 
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar (
        "Walk History",
        "null"
      ),
      bottomNavigationBar: MotionTabBar(
        labels: [
          "Walk", "Statistics", "History"
        ],
        initialSelectedTab: "Walk",
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue,
        onTabItemSelected: (int value) {
          print(value);
          setState((){
            _tabController.index = value;
          });
        },
        icons: [
          Icons.directions_walk, Icons.table_chart, Icons.history
        ],
        textStyle: TextStyle(color: Colors.blue),
      ),
      body: MotionTabBarView(
        controller: _tabController,
        children:<Widget>[
          Container(child: TimerPage()
          ),
          Container(child:
            Center(
              child: Text("Stats"),
            ),
          ),
          Container(child:
            Center(
              child: Text("History"),
            ),
          ),
        ],
      ),
    );
  }
}