import 'package:equatable/equatable.dart';

abstract class PreferenciasState extends Equatable {
  const PreferenciasState();
}

class InitialPreferenciasState extends PreferenciasState {
  @override
  List<Object> get props => [];
}
