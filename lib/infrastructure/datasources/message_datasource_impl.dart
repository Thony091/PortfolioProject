import 'package:dio/dio.dart';
import 'package:portafolio_project/infrastructure/infrastructure.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

class MessageDatasourceImpl extends MessageDatasource{

  late final Dio dio;
  // final String accessToken;

  MessageDatasourceImpl(
    // required this.accessToken
  ) : dio = Dio(
    BaseOptions(
      baseUrl: '${Enviroment.baseUrl}/message-rest',
      headers: {
        // 'Authorization': 'Bearer $accessToken'
      }
    )
  );

  @override
  Future<Message> createUpdateMessage( String name, String email, String message ) async {
    
    try {
      final data = {
        'name': name,
        'email': email,
        'message': message
      };

      final response = await dio.post( '/crear-mensaje', data: data);

      final messsage = MessageMapper.jsonToEntity(response.data);
      return messsage;

    } catch (e) {
      throw Exception();
    }

  }

  @override
  Future<void> deleteMessage(String id) async {
    
    try {
      await dio.delete('/eliminar-mensaje/$id');
    } catch (e) {
      throw Exception();
    }

  }

  @override
  Future<Message> getMessageById(String id) async {

    try {

      final response = await dio.get('/obtener-mensaje/$id');

      final mensaje = MessageMapper.jsonToEntity(response.data);
      return mensaje;

    } on DioException catch (e) {
      
      if ( e.response!.statusCode == 404) throw ServiceNotFound();
      throw e;

    } catch (e) {
      throw e;
    }

  }

  @override
  Future<List<Message>> getMessagesByPage() async {
    
    try {

      final response = await dio.get('/listar-mensajes');
      final List<Message> mensajes = [];

      if ( response.statusCode == 200 ) {
        for ( final message in response.data ?? [] ) {
          mensajes.add( MessageMapper.jsonToEntity(message) );
        }
      }
      return mensajes;

    } catch (e) {

      print('Error $e');
      return [];
    
    }
  }


}