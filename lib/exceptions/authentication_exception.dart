class AuthenticationException implements Exception {
  String message;
  AuthenticationException([this.message = 'Something went wrong']) {
    message = 'Authentication Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}