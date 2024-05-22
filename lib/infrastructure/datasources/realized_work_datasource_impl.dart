
import 'package:dio/dio.dart';
import 'package:portafolio_project/infrastructure/infrastructure.dart';

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
  Future<List<Works>> getRealizedWorks() async {

    try {
      
      final response = await dio.get('/listar-trabajos-realizados');
      final List<Works> works = [];

      if (response.statusCode == 200){

        for ( final work in response.data ?? [] ){
          works.add( RealizedWorksMapper.jsonToEntity(work) );
        }

      }
      return works;
    } catch (e) {
      
      print('Error: $e');
      return [];
      
    }

  }



}