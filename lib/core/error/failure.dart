import 'package:dio/dio.dart';

abstract class Failure {
  final String erroMessage;

  Failure(this.erroMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.erroMessage);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            "Connection timeout. Please check your internet connection and try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            "Send timeout. The request took too long to send data.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            "Receive timeout. The server took too long to respond.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "Bad certificate. There might be a problem with the server's security certificate.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            "Failed to connect to the server. Please check your network connection.");
      case DioExceptionType.unknown:
        return ServerFailure("An unknown error occurred. Please try again.");
      default:
        return ServerFailure("An unexpected error occurred.");
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('there is problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('there was an error ,please try later');
    }
  }
}
