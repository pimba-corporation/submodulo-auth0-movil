import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//abstract class PreferenciasState extends Equatable {
//  const PreferenciasState();
//  @override
//  List<Object> get props => [];
//}
//
//class InitialPreferenciasState extends PreferenciasState {
//}
//
//class EstaCargandoPreferenciasState extends PreferenciasState{}
//
//class IdiomaCambiado extends PreferenciasState{
//  final Locale locale;
//  IdiomaCambiado(this.locale);
//  @override
//  List<Object> get props => [locale];
//}
//
//class TemaCambiado extends PreferenciasState{
//  final Brightness temaColor;
//  TemaCambiado({@required this.temaColor});
//  @override
//  List<Object> get props => [temaColor];
//}
abstract class StateGeneral {
  StateGeneral _copiar();
  StateGeneral actualizar();
}

@immutable
class PreferenciasState extends StateGeneral {
  final Locale idioma;
  final Brightness tema;

  PreferenciasState({
    @required this.idioma,
    @required this.tema,
  });

  factory PreferenciasState.defecto() {
    return PreferenciasState(
      idioma: Locale('es', 'EC'),
      tema: Brightness.light,
    );
  }

  @override
  PreferenciasState _copiar({
    Locale idioma,
    Brightness tema,
  }) {
    return PreferenciasState(
      idioma: idioma ?? this.idioma,
      tema: tema ?? this.tema,
    );
  }

  @override
  PreferenciasState actualizar(
      {
        Locale idioma,
        Brightness tema,
      }
      ) {
    return this._copiar(
        tema: tema,
        idioma: idioma
    );
  }
}