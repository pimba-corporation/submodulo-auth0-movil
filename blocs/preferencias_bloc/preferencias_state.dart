import 'package:equatable/equatable.dart';

abstract class PreferenciasState extends Equatable {
  const PreferenciasState();
  @override
  List<Object> get props => [];
}

class InitialPreferenciasState extends PreferenciasState {
}

class EstaCargandoPreferenciasState extends PreferenciasState{}

class IdiomaCambiado extends PreferenciasState{}
