class ConnectionWithServerException implements Exception {
  /**
   * A message describing the error.
   */
  final String message;

  /**
   * Creates a new ConnectionWithServerException with an optional error [message].
   */
  const ConnectionWithServerException(
      [this.message = "Connection error, please try again later."]);

  String toString() => "ConnectionWithServerException: $message";
}
