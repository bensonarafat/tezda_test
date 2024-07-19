import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'error_bloc.rxb.g.dart';

abstract class ErrorBlocEvents {}

abstract class ErrorBlocStates {}

@RxBloc()
class ErrorBloc extends $ErrorBloc {}
