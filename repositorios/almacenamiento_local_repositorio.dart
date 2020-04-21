import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/enums/colores.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlmacenamientoLocalRepositorio {
  Locale _lenguajeAplicacion = Locale('es', 'EC');
  MaterialColor _temaAplicacion = Colors.blue;

  // getters
  Locale get lenguajeAplicacion => _lenguajeAplicacion ?? Locale('es', 'EC');

  MaterialColor get temaAplicacion => _temaAplicacion ?? Colors.blue;

  // metodos

  // cargar el lenguaje del sistema desde le almacenamiento local
  Future<void> _recuperarLenguajeDelSistema() async {
    SharedPreferences almacenamientoLocal =
        await SharedPreferences.getInstance();
    String lenguaje = almacenamientoLocal.getString('lang_code');
    bool tieneGuardadoLenguaje = lenguaje != null;
    if (tieneGuardadoLenguaje) {
      _lenguajeAplicacion = Locale(lenguaje);
    } else {
      _lenguajeAplicacion = Locale('es', 'EC');
    }
    print('codigo establecido ' + _lenguajeAplicacion.languageCode);
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
        _temaAplicacion = Colors.blue;
        break;
      case 'oscuro':
        _temaAplicacion = Colors.black38;
        break;
      case 'rojo':
        _temaAplicacion = Colors.red;
        break;
      default:
        _temaAplicacion = Colors.blue;
        break;
    }
  }

  Future<void> guardarTema(TemaSistema tema) async {
    var almacenamientoLocal = await SharedPreferences.getInstance();
    if (tema == TemaSistema.azul) {
      await almacenamientoLocal.setString('tema', 'azul');
    }
    if (tema == TemaSistema.rojo) {
      await almacenamientoLocal.setString('tema', 'rojo');
    }
    if (tema == TemaSistema.oscuro) {
      await almacenamientoLocal.setString('tema', 'oscuro');
    }
  }

  Future<void> cambiarIdioma(Locale lenguaje) async {
    var almacenamientoLocal = await SharedPreferences.getInstance();
    bool esElMismoLenguaje = _lenguajeAplicacion == lenguaje;
    if (esElMismoLenguaje) {
      print('llege aqui :(');
      return;
    }
    if (lenguaje == Locale('es')) {
      _lenguajeAplicacion = Locale('es', 'EC');
      await almacenamientoLocal.setString('lang_code', 'es');
      print('estoy aqui');
      // await prefs.setString('countryCode', '');
    } else {
      _lenguajeAplicacion = Locale('en');
      await almacenamientoLocal.setString('language_code', 'en');
      print('estoy aqui x 2');
      // await prefs.setString('countryCode', 'US');
    }
  }
}
