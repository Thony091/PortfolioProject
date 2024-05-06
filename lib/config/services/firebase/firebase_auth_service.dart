import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  static late FirebaseAuth auth;

  static void init(){
    auth = FirebaseAuth.instance;
  }

  static Future<void> logOut() async {
    await auth.signOut();
  }

  static Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error de autentificación: $e');
      return null;
    }
  } 

  static Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // userCredential
      return userCredential.user;
    } catch (e) {
      print('Error en el registro: $e');
      return null;
    }
  }

}