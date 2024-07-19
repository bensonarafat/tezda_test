import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tezda_test/core/datasource/repositories/auth_repository.dart';
import 'package:tezda_test/core/models/user.dart';

part 'profile_bloc.rxb.g.dart';

abstract class ProfileEvents {}

abstract class ProfileStates {
  Stream<Result<TezdaUser>> get currentUser;
}

@RxBloc()
class ProfileBloc extends $ProfileBloc {
  final AuthRepository _authRepository;

  ProfileBloc(
    this._authRepository,
  );

  @override
  Stream<Result<TezdaUser>> _mapToCurrentUserState() =>
      _authRepository.currentUser.asResultStream();
}
