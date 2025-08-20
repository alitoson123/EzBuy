//import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  /* factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection is timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send is timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive is timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            exception.response!.statusCode!, exception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "The request has been canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "there is no internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: "Unknown error occurred");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: "Your request not found, Please try again");
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: "Internal server error, Please try again");
    } else {
      return ServerFailure(
          errMessage: "opps, there was an error. Please try again");
    }
  }*/
}
