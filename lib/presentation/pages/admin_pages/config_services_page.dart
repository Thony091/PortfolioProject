import 'package:flutter/material.dart';

class ConfigServicesPage extends StatelessWidget {
  
  static const name = 'ConfigAdminServices';

  const ConfigServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração de Serviços'),
      ),
      body: ListView(
        children: const [
          
        ],
      ),
    );
  }
}