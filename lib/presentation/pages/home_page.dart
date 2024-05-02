import 'package:flutter/material.dart';
import 'package:portafolio_project/presentation/shared/widgets/side_menu.dart';

import '../../config/theme/theme.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final color       = AppTheme().getTheme().colorScheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"), backgroundColor: color.primary,),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer:  SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}