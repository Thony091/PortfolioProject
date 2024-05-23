
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../presentation.dart';

class ProfileUserPage extends StatelessWidget {

  static const name = 'ProfileUserPage';

  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final color = AppTheme().getTheme().colorScheme;
 
    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        backgroundColor: color.primary,
        title: const Text('Profile Page'),
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
    
    final authState = ref.watch( authProvider ).userData!;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
              const Text(
                "Cuenta de Usuario",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(height: 25,),
        
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset("assets/avatar.png", width: 70, height: 70),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authState.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Youtube Channel",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  // const Spacer(),
                  // ForwardButton(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => const EditAccountScreen(),
                  //     //   ),
                  //     // );
                  //   },
                  // )
                ],
              ),
            ),
        
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Imagen: ${ authStateProvider.userData!.imagenPerfil }'),
            //     Text('Nombre: ${ authStateProvider.userData!.nombre }'),
            //     Text('Rut: ${ authStateProvider.userData!.rut }'),
            //     Text('Email: ${ authStateProvider.userData!.email }'),
            //     Text('Telefono: ${ authStateProvider.userData!.telefono }'),
            //     Text('Direccion: ${ authStateProvider.userData!.direccion }'),
            //     Text('Biografia: ${ authStateProvider.userData!.bio }'),
            //   ],
            // ),
        
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
      ),
    );
  }
}