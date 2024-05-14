// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 10,),

            const Text('Expertos en brillo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
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
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text( textTest,
                            maxLines: 10,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
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
                       Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text( textTest,
                            maxLines: 10,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox( height: 20,),

            // const SizedBox(
            //   height: 350,
            //   width: double.infinity,
            // ),
            Container(
              height: 350,
              width: double.infinity,
              child: _Map()
            ),

            const SizedBox( height: 20,),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(child: Column(
                  children: [
                    const Text( 'Contacto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        hintText: 'Nombre',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        hintText: 'Correo',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Telefono',
                        hintText: 'Telefono',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mensaje',
                        hintText: 'Mensaje',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('Enviar'),
                    ),
                  ],
                )
                            ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
class _Map extends StatelessWidget {
   _Map({
    Key? key,
  });
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        mapToolbarEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}