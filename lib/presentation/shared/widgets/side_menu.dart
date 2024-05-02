
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_project/config/theme/app_theme.dart';

class SideMenu extends StatefulWidget {
  
  final GlobalKey<ScaffoldState> scaffoldKey;
  
  const SideMenu({
    super.key,
    required this.scaffoldKey,
    });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;
  final color = AppTheme().getTheme().colorScheme;
  final bool inicioSesion = false;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: color.primary,
            ),
            child: const Text(
              'AR Detailing', 
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),

          //* Iniciar Sesion
          if  ( !inicioSesion ) 
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.signIn,
                color: Color(0xff4981be),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.black54,
              ),
              title: const Text(
                'Inicio Sesion',
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, CafeteriasScreen.name);
              },
            ),
            const Divider(
              color: Colors.black12,
            ),
            

          //* Cafeterias
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.servicestack,
              color: Color(0xff4981be),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.black54,
            ),
            title: const Text(
              'Servicios',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18
              ),
            ),
            onTap: () {
              // Navigator.pushNamed(context, CafeteriasScreen.name);
            },
          ),

          //* Agenda tu hora
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.clock,
              color: Color(0xff4981be),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.black54,
            ),
            title: const Text(
              'Agenda tu hora',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18
              ),
            ),
            onTap: () {
              // Navigator.pushNamed(context, CafeteriasScreen.name);
            },
          ),
          const Divider(
            color: Colors.black12,
          ),

          //* Nuestros Trabajos
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.images,
              color: Color(0xff4981be),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.black54,
            ),
            title: const Text(
              'Nuestros trabajos',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18
              ),
            ),
            onTap: () {
              // Navigator.pushNamed(context, CafeteriasScreen.name);
            },
          ),
          const Divider(
            color: Colors.black12,
          ),

          //* SOBRE Cafeteria Virtual
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Color(0xff4981be),
            ),
            title: const Text(
              'Ayuda',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 17
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.black54,
            ),
            onTap: (){
              // Navigator.pushNamed(context, AboutScreen.name);
            },
          ),
          const Divider(
            color: Colors.black54,
            height: 0,
          ),

          //* Cerrar Sesión
          if  ( !inicioSesion ) 
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.signOut,
                color: Color(0xff4981be),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.black54,
              ),
              title: const Text(
                'Salir',
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, CafeteriasScreen.name);
              },
            ),
            const Divider(
              color: Colors.black12,
            ),

          Row( 

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[


              //* Configuración
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xfff2f2f2)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                ),
                icon: const Icon(
                  Icons.settings,
                  size: 29, 
                  color: Color.fromARGB(255, 0, 255, 42)
                ),
                label: const Text(
                  'Configuración',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                onPressed: () async {
                  // await _auth.signOut();
                  Navigator.pop(context);
                },
              ),

              //* REGISTRAR
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xfff2f2f2)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                ),
                icon: const Icon(
                  Icons.person_add,
                  size: 29, 
                  color: Color.fromARGB(255, 0, 255, 42)
                ),
                label: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                onPressed: () async {
                  // await _auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ]
          ),
        ],
      ),
    );
  }
}
