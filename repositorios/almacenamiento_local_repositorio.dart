import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlmacenamientoLocalRepositorio {
  Locale _lenguajeAplicacion = Locale('en');

  Locale get lenguajeAplicacion => _lenguajeAplicacion ?? Locale("en");

  Future<void> recuperarLenguajeDelSistema() async{
    SharedPreferences almacenamientoLocal = await SharedPreferences.getInstance();
    String lenguaje = almacenamientoLocal.getString('lang_code');
    bool tieneGuardadoLenguaje =  lenguaje != null;
    if (tieneGuardadoLenguaje) {
      _lenguajeAplicacion = Locale(lenguaje);
    } else {
      _lenguajeAplicacion = Locale('en');
    }
    return;
  }

  Future<void> cambiarIdioma(Locale lenguaje) async {
    var almacenamientoLocal = await SharedPreferences.getInstance();
    bool esElMismoLenguaje = _lenguajeAplicacion == lenguaje;
    if (esElMismoLenguaje) {
      return;
    }
    if (lenguaje == Locale("es")) {
      _lenguajeAplicacion = Locale("es");
      await almacenamientoLocal.setString('lang_code', 'es');
      // await prefs.setString('countryCode', '');
    } else {
      _lenguajeAplicacion = Locale("en");
      await almacenamientoLocal.setString('language_code', 'en');
      // await prefs.setString('countryCode', 'US');
    }
  }
}
