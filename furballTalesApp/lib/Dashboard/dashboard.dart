import 'package:flutter/material.dart';
import './grid_dashboard.dart';
import '../app_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        "Dashboard",
        'add',
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(child: GridDashboard()),
          // Container(height: 55, child: MemoList())
        ],
      ),
    );
  }
}
