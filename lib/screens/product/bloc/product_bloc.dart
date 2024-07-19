import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'product_bloc.rxb.g.dart';

abstract class ProductBlocEvents {}

abstract class ProductBlocStates {}

@RxBloc()
class ProductBloc extends $ProductBloc {}
