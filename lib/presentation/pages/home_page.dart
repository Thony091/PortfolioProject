import 'package:flutter/material.dart';

import '../widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer:  CustomAppbar(scaffoldKey: scaffoldKey,),
    );
  }
}