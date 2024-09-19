class CommonException implements Exception {
  final String? message;
  final dynamic data;

  CommonException({required this.message, this.data});

  @override
  String toString() {
    return '[COMMON_EXCEPTION] message => $message, data => $data';
  }
}
