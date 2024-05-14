import 'package:firebase_auth/firebase_auth.dart';
import 'package:portafolio_project/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/infrastructure.dart';
import '../shared/shared.dart';

/// Proveedor de estado para la gestión de la autenticación.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  
  // final authRepository = AuthRepositoryImpl(); 
  final keyValueStorageService = KeyValueStorageServiceImpl();
  
  return AuthNotifier(
    // authRepository: authRepository,
    keyValueStorageService: keyValueStorageService
  ); 
});

/// Clase notificadora de estado para la gestión de la autenticación.
class AuthNotifier extends StateNotifier<AuthState>{
  
  // final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    // required this.authRepository,
    required this.keyValueStorageService,
  }): super(AuthState()){
    checkAuthStatus();
  }

  /// Método para iniciar sesión de un usuario.
  Future<void> loginUserFireBase( String email, String password ) async{

    try {
      
      await Future.delayed(const Duration(milliseconds: 500));

      final user = await FirebaseAuthService.auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      _setLoggedUser(user);
      
    } on CustomError {
      logOut( 'Credenciales no son correctas' );
    } catch(e){
      logOut('Error no controlado');
    }
    print('Status desde logIn(): ${state.authStatus}');
  }

  /// Método para registrar un nuevo usuario.
  void registerUserFireBase( String email, String password, String name, String rut, String birthday, String phone ) async {

    User? _userCredential = await FirebaseAuthService.signUpWithEmailAndPassword(email, password);

    final data = {
      'email': email,
      'password': password,
      'uid': _userCredential?.uid,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'rut': rut,
      'birthday': birthday,
      'phone': phone
    };

    
    // final user = await FirebaseAuthService.signUpWithEmailAndPassword(email, password);
    // Implementar la lógica de registro de usuario.
  }

  /// Método para verificar el estado de autenticación.
  void checkAuthStatus() async {

    final token = await keyValueStorageService.getValue<String>('token');

    if( token == null ) return logOut();

    try {

      // final user = await authRepository.checkAuthStatus(token);
      
      // _setLoggedUser(user);

    } catch (e) {
      logOut();
    }

  }

  /// Método privado para establecer el usuario autenticado. 
  void _setLoggedUser (UserCredential user) async {

    final tokenId = await user.user!.getIdToken();

    Future.delayed(const Duration(milliseconds: 500));
 
    // Verifica si tokenId es null antes de intentar almacenarlo.
    if (tokenId!= null) {

      await keyValueStorageService.setKeyValue('token', tokenId);

    } else {
      print('Token ID is null');
    }
    
    final token = await keyValueStorageService.getValue<String>('token');
    print('Token guardado?: $token');

    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  /// Método para cerrar sesión del usuario.
  Future<void> logOut([ String? errorMessage ]) async {

    await FirebaseAuthService.logOut();
    
    await keyValueStorageService.removeKey('token');
    print('Token eliminado correctamente');

    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage
    );
    print('Status desde logOut(): ${state.authStatus}');
  }
}

/// Enumeración que representa los posibles estados de autenticación.
enum AuthStatus{ checking, authenticated, notAuthenticated}

/// Clase que representa el estado de la autenticación.
class AuthState {
   
  final AuthStatus authStatus;
  final UserCredential? user;
  final String errorMessage;
  final Map<String,dynamic>? userData;


  AuthState({
    this.authStatus = AuthStatus.checking, 
    this.user, 
    this.errorMessage = '',
    this.userData,
  });

  /// Método para crear una copia del estado con cambios específicos.
  AuthState copyWith({
    AuthStatus? authStatus,
    UserCredential? user,
    String? errorMessage,
    Map<String,dynamic>? userData,
  }) => AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      userData: userData ?? this.userData
  );

}