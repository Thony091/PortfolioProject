import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_project/config/constants/constants.dart';
import 'package:portafolio_project/config/services/firebase/firebase_service.dart';
import 'package:portafolio_project/presentation/pages/home_page.dart';

void main() async {
  
  await Enviroment.initEnvironment();
  
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Initialize Firebase
  await FirebaseService.init();

  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
