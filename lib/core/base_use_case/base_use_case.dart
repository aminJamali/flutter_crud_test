import 'package:dartz/dartz.dart';

abstract class BaseUseCase<R, P> {
  Future<Either<Exception, R>> call(final P params);
}
