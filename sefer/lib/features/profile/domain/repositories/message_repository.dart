import 'package:dartz/dartz.dart';
import 'package:sefer/core/errors/failures.dart';
import 'package:sefer/features/profile/domain/entities/message.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<Message>>> getMessages(String userId);
  Future<Either<Failure, List<Message>>> getChatMessages(
      String userId, String chatUserId);
  Future<Either<Failure, Unit>> sendMessage(Message message);
  Future<Either<Failure, Unit>> deleteMessage(String messageId);
}
