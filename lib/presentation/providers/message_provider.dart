
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

final messageProvider = StateNotifierProvider.autoDispose<MessageNotifier, MessageState>((ref) {

  final messageRepository = MessageRepositoryImpl();

  return MessageNotifier(
    messageRepository: messageRepository
  );
});


class MessageNotifier extends StateNotifier<MessageState>{

  final MessageRepository messageRepository;

  MessageNotifier({
    required this.messageRepository
  }): super(MessageState());

  Future<void> postMessage(String name, String email, String message) async{

    try {

      final messsage = await messageRepository.createUpdateMessage(name, email, message);

      state = state.copyWith(
        message: messsage
      );

    } on CustomError catch(e){
      state = state.copyWith(
        errorMessage: e.message
      );
    }
  }

}

class MessageState{

  final Message? message;
  final String errorMessage;

  MessageState({
    this.message,
    this.errorMessage = ''
  });

  MessageState copyWith({
    Message? message,
    String? errorMessage
  }) => MessageState(
    message: message ?? this.message,
    errorMessage: errorMessage ?? this.errorMessage
  );

}