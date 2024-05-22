import '../../domain/domain.dart';

class MessageRepositoryImpl extends MessageRepository {
  
  final MessageDatasource messageDatasource;

  MessageRepositoryImpl( this.messageDatasource );
  
  @override
  Future<Message> createUpdateMessage(Map<String, dynamic> messageSimilar) {
    return messageDatasource.createUpdateMessage( messageSimilar );
  }
  
  @override
  Future<void> deleteMessage(String id) {
    return messageDatasource.deleteMessage(id);
  }
  
  @override
  Future<Message> getMessageById(String id) {
    return messageDatasource.getMessageById(id);
  }
  
  @override
  Future<List<Message>> getMessagesByPage() {
    return messageDatasource.getMessagesByPage();
  }


}