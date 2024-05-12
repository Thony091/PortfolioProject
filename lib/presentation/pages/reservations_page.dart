import 'package:flutter/material.dart';

import '../shared/widgets/side_menu.dart';

class ReservationsPage extends StatelessWidget {

  static const name = 'ReservationsPage';
  
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservations Page"),),
      body: const Center(
        child: Text('Reservations Page'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}