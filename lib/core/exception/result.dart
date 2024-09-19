import 'exceptions.dart';

sealed class Result<T> {}

class RESULT<T> extends Result<T> {
  final T data;
  RESULT(this.data);
}

class EXCEPTION<T> extends Result<T> {
  final CommonException exception;
  EXCEPTION(this.exception);
}
