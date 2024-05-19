import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_project/presentation/providers/auth_provider.dart';

class HomeAdminPage extends StatefulWidget {

  static const name = 'HomeAdminPage';

  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Admin Page'),
      ),
      body: const _HomeAdminBodyPage()
    );
  }
}

class _HomeAdminBodyPage extends ConsumerWidget {
  const _HomeAdminBodyPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final authStateProvider = ref.watch( authProvider );

    return  Center(
      child: Column(
        children: [
          const SizedBox(height: 25,),
          const Text('Home Admin Page'),
          const SizedBox(height: 35,),
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Imagen:    ${ authStateProvider.userData!.imagenPerfil }'),
              Text('Nombre:    ${ authStateProvider.userData!.nombre }'),
              Text('Rut:       ${ authStateProvider.userData!.rut }'),
              Text('Email:     ${ authStateProvider.userData!.email }'),
              Text('Telefono:  ${ authStateProvider.userData!.telefono }'),
              Text('Es Admin:  ${ authStateProvider.userData!.isAdmin }'),
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
              context.push('/home-admin-page');
            },
            child: const Text('Go Home!'),
          ),
        ],
      ),
    );
  }
}