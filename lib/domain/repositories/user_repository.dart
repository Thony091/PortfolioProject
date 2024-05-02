import '../domain.dart';

abstract class UserRepository {

  Future<User> getUser();
  
  Future<User> login (String email, String password);

  Future<User> register(User user);

  Future<User> updateUser(User user);

  Future<void> deleteUser();

  Future<User> checkAuthStatus(String token);


}