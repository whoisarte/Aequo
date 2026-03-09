import '../entities/user_session.dart';
import '../repositories/session_repository.dart';

class GetSession {
  final SessionRepository _repository;

  const GetSession(this._repository);

  UserSession call() => _repository.getSession();
}