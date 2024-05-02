import 'package:flutter/material.dart';

import '../shared/widgets/side_menu.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Page"),),
      body: const Center(
        child: Text('Products Page'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}