
import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

class RealizedWorkDatasourceImpl extends RealizedWorkDatasource {

  late final Dio dio;
  final String accessToken;

  RealizedWorkDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: '${Enviroment.baseUrl}/realized-work-rest',
      headers: {
        'Authorization': 'Bearer $accessToken'
      }
    )
  );

  @override
  Future<Works> createUpdateWorks(Map<String, dynamic> worksSimilar) {
    // TODO: implement createUpdateWorks
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWork(String id) {
    // TODO: implement deleteWork
    throw UnimplementedError();
  }

  @override
  Future<Works> getRealizedWorkById(String id) {
    // TODO: implement getRealizedWorkById
    throw UnimplementedError();
  }

  @override
  Future<List<Works>> getRealizedWorks() {
    // TODO: implement getRealizedWorks
    throw UnimplementedError();
  }



}