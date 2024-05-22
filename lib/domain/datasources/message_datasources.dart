import '../domain.dart';

abstract class MessageDatasource {

  Future<List<Message>> getMessagesByPage();
  Future<Message> getMessageById( String id );
  Future<Message> createUpdateMessage( Map<String, dynamic> messageSimilar );
  Future<void> deleteMessage( String id );
}
