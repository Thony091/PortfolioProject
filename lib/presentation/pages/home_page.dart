import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/theme.dart';
import '../presentation.dart';

class HomePage extends ConsumerStatefulWidget {

  static const name = 'HomePage';

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>{
  @override
  Widget build(BuildContext context ) {

    final authStatusProvider  = ref.read( authProvider );
    final color               = AppTheme().getTheme().colorScheme;
    final scaffoldKey         = GlobalKey<ScaffoldState>();
    
    return  Scaffold(
      drawer:  SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: Text((authStatusProvider.authStatus == AuthStatus.authenticated) 
          ? 'Hola ${authStatusProvider.user!.user!.email}' 
          : 'Hola Invitado'
        ), 
        backgroundColor: color.primary,
      ),
      body: const Center(
        child: _HomeBodyPage(),
      ),
    );
  }
}

class _HomeBodyPage extends ConsumerWidget {
  const _HomeBodyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('Home Page');
  }
}