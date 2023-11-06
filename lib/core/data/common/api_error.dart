class ApiError implements Exception {
  final String message;

  final int? statusCode;
  final String? reason;
  final Exception? innerError;

  ApiError(this.message, {this.statusCode, this.reason, this.innerError});

  @override
  String toString() {
    return 'ApiError: $message (code: $statusCode)';
  }
}
