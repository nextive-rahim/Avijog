import 'error_model.dart';

class NetworkException implements Exception {
  NetworkException(this.errorModel);

  final ErrorResponseModel errorModel;

  @override
  String toString() {
    return errorModel.toString();
  }
}

class NotFoundException extends NetworkException {
  NotFoundException(super.errorModel);
}

class RequestTimeoutException extends NetworkException {
  RequestTimeoutException(super.errorModel);
}

class BadRequestException extends NetworkException {
  BadRequestException(super.errorModel);
}

class BadGatewayException extends NetworkException {
  BadGatewayException(super.errorModel);
}

class DefaultException extends NetworkException {
  DefaultException(super.errorModel);
}

class RequestCancelledException extends NetworkException {
  RequestCancelledException(super.errorModel);
}

class ReceiveTimeoutException extends NetworkException {
  ReceiveTimeoutException(super.errorModel);
}

class FetchDataException extends NetworkException {
  FetchDataException(super.errorModel);
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException(super.errorModel);
}

class ConflictException extends NetworkException {
  ConflictException(super.errorModel);
}

class InternalServerException extends NetworkException {
  InternalServerException(super.errorModel);
}

class UnexpectedException extends NetworkException {
  UnexpectedException(super.errorModel);
}

class InvalidInputException extends NetworkException {
  InvalidInputException(super.errorModel);
}

class UnAuthenticatedException extends NetworkException {
  UnAuthenticatedException(super.errorModel);
}

class BadCertificateException extends NetworkException {
  BadCertificateException(super.errorModel);
}

class BadResponseException extends NetworkException {
  BadResponseException(super.errorModel);
}
