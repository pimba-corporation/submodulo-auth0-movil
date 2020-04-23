import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlmacenamientoLocalRepositorio {
  Locale _lenguajeAplicacion = Locale('es', 'EC');
  Brightness _temaAplicacion = Brightness.light;

  // getters
  Locale get lenguajeAplicacion => _lenguajeAplicacion ?? Locale('es', 'EC');

  Brightness get temaAplicacion => _temaAplicacion ?? Brightness.light;
  // cargar el lenguaje del sistema desde le almacenamiento local
  Future<void> _recuperarLenguajeDelSistema() async {
    SharedPreferences almacenamientoLocal =
        await SharedPreferences.getInstance();
    String lenguaje = almacenamientoLocal.getString('lang_code');
    bool tieneGuardadoLenguaje = lenguaje != null;
    if (tieneGuardadoLenguaje) {
      _lenguajeAplicacion = Locale(lenguaje);
      print('recupere el idioma ' + lenguaje);
    } else {
      _lenguajeAplicacion = Locale('es', 'EC');
    }
    return;
  }

  Future<void> obtenerInformacionGuardada() async{
    await this._recuperarLenguajeDelSistema();
    await this._recuperarTemaDelSistema();
  }

  Future<void> _recuperarTemaDelSistema() async {
    SharedPreferences almacenamientoLocal =
        await SharedPreferences.getInstance();
    String tema = almacenamientoLocal.getString('tema');
    switch (tema) {
      case 'azul':
        _temaAplicacion = Brightness.light;
        print('recupere azul');
        break;
      case 'oscuro':
        print('recupere oscuro');
        _temaAplicacion = Brightness.dark;
        break;
      default:
        _temaAplicacion = Brightness.light;
        break;
    }
  }

  Future<Brightness> guardarTema(Brightness tema) async {
    var almacenamientoLocal = await SharedPreferences.getInstance();
    if (tema == Brightness.light) {
      await almacenamientoLocal.setString('tema', 'azul');
    }
    if (tema == Brightness.dark) {
      await almacenamientoLocal.setString('tema', 'oscuro');
    }
    return tema;
  }

  Future<void> guardarIdioma(Locale lenguaje) async {
    var almacenamientoLocal = await SharedPreferences.getInstance();
    bool esElMismoLenguaje = _lenguajeAplicacion == lenguaje;
    if (esElMismoLenguaje) {
      return;
    }
    if (lenguaje == Locale('es')) {
      _lenguajeAplicacion = Locale('es', 'EC');
      await almacenamientoLocal.setString('lang_code', 'es');
      // await prefs.setString('countryCode', '');
    } else {
      _lenguajeAplicacion = Locale('en');
      await almacenamientoLocal.setString('lang_code', 'en');
      // await prefs.setString('countryCode', 'US');
    }
  }
}
