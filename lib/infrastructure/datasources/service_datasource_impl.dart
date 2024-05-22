import 'package:dio/dio.dart';
import 'package:portafolio_project/domain/domain.dart';

import '../../config/config.dart';

class ServicesDatasourceImpl extends ServicesDatasource {

  late final Dio dio;
  final String accessToken;

  ServicesDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: '${ Enviroment.baseUrl }/service-rest',
      headers: {
        'Authorization': 'Bearer $accessToken'
      }
    )
  );

  @override
  Future<Services> createUpdateService(Map<String, dynamic> serviceSimilar) {
    // TODO: implement createUpdateService
    throw UnimplementedError();
  }

  @override
  Future<void> deleteService(String id) {
    // TODO: implement deleteService
    throw UnimplementedError();
  }

  @override
  Future<Services> getServiceById(String id) {
    // TODO: implement getServiceById
    throw UnimplementedError();
  }

  @override
  Future<List<Services>> getServices() {
    // TODO: implement getServices
    throw UnimplementedError();
  }



}