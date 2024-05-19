
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../presentation.dart';

class ConfigUserPage extends StatelessWidget {

  static const name = 'ConfigUserPage';

  const ConfigUserPage({super.key});

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
        child: _ConfigUserBodyPage()
      ),
    );
  }
}

class _ConfigUserBodyPage extends ConsumerWidget {
  const _ConfigUserBodyPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final authStateProvider = ref.watch( authProvider );
    
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 25,),
          const Text('Config Page'),
          const SizedBox(height: 35,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Imagen: ${ authStateProvider.userData!.imagenPerfil }'),
              Text('Nombre: ${ authStateProvider.userData!.nombre }'),
              Text('Rut: ${ authStateProvider.userData!.rut }'),
              Text('Email: ${ authStateProvider.userData!.email }'),
              Text('Telefono: ${ authStateProvider.userData!.telefono }'),
              Text('Direccion: ${ authStateProvider.userData!.direccion }'),
              Text('Biografia: ${ authStateProvider.userData!.bio }'),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              // context.push('/editor-data-page');
            },
            child: const Text('Editar'),
          ),
          const SizedBox(height: 40,),
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