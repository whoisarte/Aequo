import '../entities/user_session.dart';

abstract interface class SessionRepository {
  UserSession getSession();
}