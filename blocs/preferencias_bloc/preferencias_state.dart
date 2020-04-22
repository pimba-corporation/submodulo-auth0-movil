import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PreferenciasState extends Equatable {
  const PreferenciasState();
  @override
  List<Object> get props => [];
}

class InitialPreferenciasState extends PreferenciasState {
}

class EstaCargandoPreferenciasState extends PreferenciasState{}

class IdiomaCambiado extends PreferenciasState{
  final Locale locale;
  IdiomaCambiado(this.locale);
  @override
  List<Object> get props => [locale];
}

class TemaCambiado extends PreferenciasState{
  final Brightness temaColor;
  TemaCambiado({@required this.temaColor});
  @override
  List<Object> get props => [temaColor];
}
