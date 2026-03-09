import '../../domain/entities/user_session.dart';
import '../../domain/repositories/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  const SessionRepositoryImpl();

  @override
  UserSession getSession() {
    return const UserSession(isUserLogged: false);
  }
}