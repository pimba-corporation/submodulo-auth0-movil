import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/repositorios/local/almacenamiento_local_repositorio.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class PreferenciasBloc extends Bloc<PreferenciasEvent, PreferenciasState> {

  final AlmacenamientoLocalRepositorio almacenamientoLocalRepositorio;

  PreferenciasBloc({@required this.almacenamientoLocalRepositorio}): assert(almacenamientoLocalRepositorio != null);

  @override
  PreferenciasState get initialState => PreferenciasState.defecto();

  @override
  Stream<PreferenciasState> mapEventToState(
    PreferenciasEvent event,
  ) async* {
    // Cuando la aplicacion inicia se cargan los datos del almacenamiento local
    if (event is InicioAplicacionPreferenciasEvent){
      // Obtener los datos del almacenamiento local
      Brightness temaColor = this.almacenamientoLocalRepositorio.temaAplicacion;
      Locale idioma = this.almacenamientoLocalRepositorio.lenguajeAplicacion;
      // actualizar el estado con los datos obtenidos
      yield state.actualizar(idioma: idioma, tema: temaColor);
    }
    // Cuando cambia el idioma del sistema
    if (event is CambioIdiomaEvent){
      await this.almacenamientoLocalRepositorio.guardarIdioma(event.lenguaje);
      yield state.actualizar(idioma: this.almacenamientoLocalRepositorio.lenguajeAplicacion );
    }
    // Cuando cambia el tema del sistema
    if (event is CambioTemaEvent){
      Brightness temaColor = await this.almacenamientoLocalRepositorio.guardarTema(event.colorTema);
      yield state.actualizar(tema: temaColor);
    }
  }
}
