import 'package:flutter/material.dart';

import '../shared/widgets/side_menu.dart';

class PagoPage extends StatelessWidget {

  static const name = 'pagoPage';
  
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pago Page"),),
      body: const Center(
        child: Text('Pago Page'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}