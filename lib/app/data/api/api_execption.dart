/// The [AppException] class handles application exceptions.
class AppException implements Exception {
  final String? message;
  final String? prefix;

  /// Creates an [AppException] with an optional [message] and [prefix].
  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

/// Exception thrown when there is an issue fetching data from the server.
class FetchDataException extends AppException {
  /// Creates a [FetchDataException] with an optional [message].
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

/// Exception thrown when a bad request or missing parameters are encountered.
class BadRequestException extends AppException {
  /// Creates a [BadRequestException] with an optional [message].
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

/// Exception thrown when unauthorized access is detected.
class UnauthorisedException extends AppException {
  /// Creates an [UnauthorisedException] with an optional [message].
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

/// Exception thrown when invalid input is provided to the server.
class InvalidInputException extends AppException {
  /// Creates an [InvalidInputException] with an optional [message].
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
