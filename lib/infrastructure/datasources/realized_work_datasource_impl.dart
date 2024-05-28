
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

    Future<String> _uploadFile( String path ) async {

    try {

      final fileName = path.split('/').last;
      final FormData data = FormData.fromMap({
        'file': MultipartFile.fromFileSync(path, filename: fileName)
      });

      final respose = await dio.post('/files/product', data: data );

      return respose.data['image'];

    } catch (e) {
      throw Exception();
    }

  }

  Future<List<String>> _uploadPhotos( List<String> photos ) async {
    
    final photosToUpload = photos.where((element) => element.contains('/') ).toList();
    final photosToIgnore = photos.where((element) => !element.contains('/') ).toList();

    //Todo: crear una serie de Futures de carga de imágenes
    final List<Future<String>> uploadJob = photosToUpload.map(_uploadFile).toList();

    final newImages = await Future.wait(uploadJob);
    
    return [...photosToIgnore, ...newImages ];
  }

  @override
  Future<Works> createUpdateWorks(Map<String, dynamic> worksSimilar) async {
    
    try {
      
      final String? serviceId = worksSimilar['id'];
      final String method = (serviceId == null) ? 'POST' : 'PUT';
      final String url = (serviceId == null) ? '/crear-servicio' : '/actualizar-servicio';
      // final String url = (serviceId == null) ? '/crear-servicio' : '/actualizar-servicio/$serviceId';

      // worksSimilar.remove('id');
      worksSimilar['images'] = await _uploadPhotos( worksSimilar['images'] );


      final response = await dio.request(
        url,
        data: worksSimilar,
        options: Options(
          method: method
        )
      );

      final work = RealizedWorksMapper.jsonToEntity(response.data);
      return work;

    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteWork(String id) {

    try {
      
      return dio.delete('/eliminar-trabajo-realizado/$id');

    } catch (e) {
      throw Exception(e);
    }

  }

  @override
  Future<Works> getRealizedWorkById(String id) async {
    
    try {
      
      final response = await dio.get('/obtener-trabajo-realizado/$id');

      final work = RealizedWorksMapper.jsonToEntity(response.data);

      return work;
    } on DioException catch (e) {
      
      if ( e.response!.statusCode == 404 )  throw RealizedWorkNotFound();
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
      
    }

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