import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PreferenciasBloc extends Bloc<PreferenciasEvent, PreferenciasState> {
  @override
  PreferenciasState get initialState => InitialPreferenciasState();

  @override
  Stream<PreferenciasState> mapEventToState(
    PreferenciasEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
