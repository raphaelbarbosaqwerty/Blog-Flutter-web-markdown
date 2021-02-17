import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';

abstract class States {}

class StartState implements States {
  const StartState();
}

class LoadingState implements States {
  const LoadingState();
}

class ErrorState implements States {
  final Failure error;
  const ErrorState(this.error);
}
