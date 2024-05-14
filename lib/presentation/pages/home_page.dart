// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

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
      body: const _HomeBodyPage(),
      
    );
  }
}

class _HomeBodyPage extends ConsumerWidget {
  const _HomeBodyPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String textTest = loremIpsum(words: 150, paragraphs: 3);
    final size = MediaQuery.of(context).size;

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            const SizedBox(height: 20,),
            
            const Text('Expertos en brillo', 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Text( textTest, 
                        maxLines: 10,
                        style: const TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w400,                          
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Image.asset(
                        'assets/images/AR_2.png',
                        height: 150,
                        width: 300,
                      ),
                      const SizedBox(height: 3,),
                      Text( textTest, 
                        maxLines: 10,
                        style: const TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w400,                          
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox( height: 20,),

          ],
        ),
      )
    );
  }
}