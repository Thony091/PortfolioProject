import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';
import '../shared/widgets/widgets.dart';


class HomePage extends StatelessWidget {

  static const name = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final color       = AppTheme().getTheme().colorScheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"), 
        backgroundColor: color.primary,
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer:  SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}