

import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

class UserDatasourceImpl extends UserDatasource {

  final dio = Dio( BaseOptions(
    baseUrl: "${Enviroment.baseUrl}/user-rest"
  ));
  
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  
  @override
  Future<User> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }





}