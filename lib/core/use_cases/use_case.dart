import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<T, Param, Param2> {
  Future<Either<Failure, T>> call([Param param, Param2 param2]);
}

class NoParams {}
