
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../presentation.dart';

class ConfigPage extends StatelessWidget {

  static const name = 'configPage';

  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final color = AppTheme().getTheme().colorScheme;
 
    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        backgroundColor: color.primary,
        title: const Text('Config Page'),
      ),
      body:  const BackgroundImageWidget(
        opacity: 0.1,
        child: _ConfigPage()
      ),
    );
  }
}

class _ConfigPage extends StatelessWidget {
  const _ConfigPage();

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        children: [
          const SizedBox(height: 25,),
          const Text('Config Page'),
          ElevatedButton(
            onPressed: () {
              context.push('/');
            },
            child: const Text('Go Home!'),
          ),
        ],
        
      ),
    );
  }
}