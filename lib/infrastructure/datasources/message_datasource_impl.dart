import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

class MessageDatasourceImpl extends MessageDatasource{

  late final Dio dio;
  final String accessToken;

  MessageDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: '${Enviroment.baseUrl}/message-rest',
      headers: {
        'Authorization': 'Bearer $accessToken'
      }
    )
  );

  @override
  Future<Message> createUpdateMessage(Map<String, dynamic> messageSimilar) {
    // TODO: implement createUpdateMessage
    throw UnimplementedError();
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