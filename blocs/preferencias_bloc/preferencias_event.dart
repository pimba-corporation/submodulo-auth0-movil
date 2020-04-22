import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/enums/colores.dart';

abstract class PreferenciasEvent extends Equatable {
  const PreferenciasEvent();
}

class CambioIdiomaEvent extends PreferenciasEvent {
  final Locale lenguaje;
  CambioIdiomaEvent({@required this.lenguaje});

  @override
  List<Object> get props => [lenguaje];

}

class CambioTemaEvent extends PreferenciasEvent {
  final Brightness colorTema;
  CambioTemaEvent({@required this.colorTema}): assert(colorTema != null);
  @override
  List<Object> get props => [colorTema];
}