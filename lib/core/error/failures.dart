import 'package:equatable/equatable.dart';

import '../utils/constants.dart';


abstract class Failure extends Equatable {
  final customProps = const <dynamic>[];

  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure();

  @override
  List<dynamic> get props => customProps;
}





class ServerFailure extends Failure {
  const ServerFailure({required this.message, required this.errorCode});
  final String? message;
  final String? errorCode;

  @override
  List<dynamic> get props => [
    message,
    errorCode,
  ];
}

class CacheFailure extends Failure {
  const CacheFailure({required this.message, required this.errorCode});
  final String? message;
  final String? errorCode;

  @override
  List<dynamic> get props => [
    message,
    errorCode,
  ];
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure({required this.message, required this.errorCode});
  final String? message;
  final String? errorCode;

  @override
  List<dynamic> get props => [
    message,
    errorCode,
  ];
}
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required this.message, required this.errorCode});
  final String? message;
  final String? errorCode;

  @override
  List<dynamic> get props => [
    message,
    errorCode,
  ];
}


String mapFailureToErrorMessage(Failure failure) {
  print("failure.runtimeTypefailure.runtimeType ${failure.runtimeType}");
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message ??
          serverFailureMessage;
    case CacheFailure:
      return (failure as CacheFailure).message ??
          cacheFailureMessage;
    case UnauthorizedFailure:
      return (failure as UnauthorizedFailure).message ??
          unauthorisedMessage;
    default:
      return 'Unexpected Error';
  }
}

String mapFailureToErrorCode(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).errorCode ??
          serverFailureCode;
    case CacheFailure:
      return (failure as CacheFailure).errorCode ??
          cacheFailureCode;
    case UnauthorizedFailure:
      return (failure as UnauthorizedFailure).errorCode ??
          unauthorisedCode;
    default:
      return 'Unexpected Error';
  }
}
