import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../presentation.dart';


class ServicesPage extends StatelessWidget {

  static const name = 'ServicesPage';
  
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {

    // final scaffoldKey = GlobalKey<ScaffoldState>();
    final color = AppTheme().getTheme().colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services Page"),
        backgroundColor: color.primary,
      ),
      body: const BackgroundImageWidget(
        opacity: 0.1,
        child: _ServicesPageBody()
        ),
      // drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _ServicesPageBody extends ConsumerWidget {
  const _ServicesPageBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    
    return SingleChildScrollView(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Servicios", 
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          // bottomLeft: Radius.circular(10),
                          // bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/brillos/JWC1.jpeg',
                        width: 200,
                        height: 200,
                      )
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          // topLeft: Radius.circular(10),
                          // topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child:  const Column(
                        children: [
                          SizedBox(height: 5),
                          Text('Lavado Boutique', 
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        // SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric( horizontal: 10.0),
                          child: Text('''
                            Descontaminado quimico de llantas.
                            Lavado show foam.
                            Aplicacion cera liquida (brillo y proteccion por 2 semanas)
                            Acondicionamiento de neumaticos,
                            plasticos y molduras exteriores.
                            Cortesia: limpieza aspirado y ACONDICIONAMIENTO DE INTERIOR.

                            Desde 
                            ''', 
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        ],
                      )
                    )
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
