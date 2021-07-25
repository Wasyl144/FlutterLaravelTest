class CredentialsNotFoundException implements Exception {
  /**
   * A message describing the error.
   */
  final String message;

  /**
   * Creates a new CredentialsNotFoundException with an optional error [message].
   */
  const CredentialsNotFoundException([this.message = "Email or password is incorrect"]);

  String toString() => "CredentialsNotFoundException: $message";
}