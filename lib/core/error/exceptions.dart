class ServerException implements Exception {}

class CacheException implements Exception {}
class SerializationException implements Exception {}

class UnverifiedUserException implements Exception {}
class NeedToLoginException implements Exception {}

class GeneralException implements Exception {
  final String message;

  GeneralException({required this.message});
}