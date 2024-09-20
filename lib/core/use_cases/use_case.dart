import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}

class NoParams {}
