import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/repositorios/almacenamiento_local_repositorio.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AlmacenamientoLocalRepositorio almacenamientoLocalRepositorio;

  AuthBloc({@required this.almacenamientoLocalRepositorio}): assert(almacenamientoLocalRepositorio != null);

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
