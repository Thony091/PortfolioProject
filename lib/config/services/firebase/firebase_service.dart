import 'package:firebase_core/firebase_core.dart';
import 'package:portafolio_project/config/services/firebase/firebase_auth_service.dart';

import '../../../firebase_options.dart';

class FirebaseService{

  static Future<void> init() async{
    
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuthService.init();

  }

}