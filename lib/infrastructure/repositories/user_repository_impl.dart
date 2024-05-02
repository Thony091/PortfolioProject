

import '../../domain/domain.dart';
import '../infrastructure.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDatasource datasource;

  UserRepositoryImpl( 
    UserDatasource? datasource
  ) : datasource = datasource ?? UserDatasourceImpl();
  

  @override
  Future<User> checkAuthStatus(String token) async {
    return await datasource.checkAuthStatus(token);
  }

  @override
  Future<void> deleteUser() async {
    return await datasource.deleteUser();
  }

  @override
  Future<User> getUser() async {
    return await datasource.getUser();
  }

  @override
  Future<User> login(String email, String password) async {
    return await datasource.login(email, password);
  }

  @override
  Future<User> register(User user) async {
    return await datasource.register(user);
  }

  @override
  Future<User> updateUser(User user) async {
    return await datasource.updateUser(user);
  }
}