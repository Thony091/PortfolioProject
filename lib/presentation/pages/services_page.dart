import 'package:flutter/material.dart';

import '../shared/widgets/side_menu.dart';

class ServicesPage extends StatelessWidget {

  static const name = 'ServicesPage';
  
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Services Page"),),
      body: const Center(
        child: Text('Services Page'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}