sealed class Result<T> {}

final class SuccessResult<T> extends Result<T> {
  T data;

  SuccessResult(this.data);
}

final class FailureResult<T> extends Result<T> {
  Exception exception;

  FailureResult(this.exception);
}
