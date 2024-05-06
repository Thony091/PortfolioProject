import 'package:portafolio_project/config/config.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/domain.dart';
import '../../infrastructure/errors/auth_errors.dart';
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

      final tokenId = await user.user!.getIdToken();
      print('Token: $tokenId');
      // final user = await authRepository.login(email, password);
      // _setLoggedUser(user);
      
    } on CustomError {
      logOut( 'Credenciales no son correctas' );
    } catch(e){
      logOut('Error no controlado');
    }

  }

  /// Método para registrar un nuevo usuario.
  void registerUSer( String email, String password ) async {

    final user = await FirebaseAuthService.signUpWithEmailAndPassword(email, password);
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
  void _setLoggedUser (User user) async {
 
    // await keyValueStorageService.setKeyValue( 'token', user.token);

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

    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage
    );
  }
}

/// Enumeración que representa los posibles estados de autenticación.
enum AuthStatus{ checking, authenticated, notAuthenticated}

/// Clase que representa el estado de la autenticación.
class AuthState {
   
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking, 
    this.user, 
    this.errorMessage = ''
  });

  /// Método para crear una copia del estado con cambios específicos.
  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage
  }) => AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage
  );

}