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
  Future<void> deleteMessage(String id) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<Message> getMessageById(String id) {
    // TODO: implement getMessageById
    throw UnimplementedError();
  }

  @override
  Future<List<Message>> getMessagesByPage() {
    // TODO: implement getMessagesByPage
    throw UnimplementedError();
  }


}