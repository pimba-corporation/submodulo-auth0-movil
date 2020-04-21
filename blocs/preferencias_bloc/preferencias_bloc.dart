import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/repositorios/almacenamiento_local_repositorio.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class PreferenciasBloc extends Bloc<PreferenciasEvent, PreferenciasState> {

  final AlmacenamientoLocalRepositorio almacenamientoLocalRepositorio;

  PreferenciasBloc({@required this.almacenamientoLocalRepositorio}): assert(almacenamientoLocalRepositorio != null);

  @override
  PreferenciasState get initialState => InitialPreferenciasState();

  @override
  Stream<PreferenciasState> mapEventToState(
    PreferenciasEvent event,
  ) async* {
    yield EstaCargandoPreferenciasState();
    if (event is CambioIdiomaEvent){
      print('aqui el evento');
      await this.almacenamientoLocalRepositorio.cambiarIdioma(event.lenguaje);
      yield IdiomaCambiado(this.almacenamientoLocalRepositorio.lenguajeAplicacion);
    }
  }
}
