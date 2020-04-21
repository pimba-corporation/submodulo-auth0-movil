import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PreferenciasEvent extends Equatable {
  const PreferenciasEvent();
}

class CambioIdiomaEvent extends PreferenciasEvent {
  final Locale lenguaje;
  CambioIdiomaEvent({@required this.lenguaje});

  @override
  // TODO: implement props
  List<Object> get props => [lenguaje];

}