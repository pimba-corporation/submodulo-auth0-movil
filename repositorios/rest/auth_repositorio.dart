import 'package:flutter/widgets.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/entidades/usuario_entidad.dart';

class AuthRepositorio {
  UsuarioEntidad usuario;
  String _token = '';

  // Metodo para obtener el token
  Future<void> autenticar({
    @required String email,
    @required String password,
  }) async {
    // simular peticion http
    await Future.delayed(Duration(seconds: 1));
    this._token = 'token_generado';
    return;
  }

  // Borrar el token
  Future<void> borrarToken() async {
    await Future.delayed(Duration(seconds: 1));
    this._token = '';
    return;
  }

  // Refrescar el token
  Future<void> guardarToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    this._token = token;
    return;
  }

  // Refrescar el token
  Future<bool> tieneToken() async {
    await Future.delayed(Duration(seconds: 1));
    return this._token != '' ? true : false;
  }

  // Establecer login
  Future <bool> verificarCodigoConfirmacion(String codigoConfirmacion) async {
    // bool coincideCodigo = codigoConfirmacion == this.usuarioConfirmacionModelo.codigo;
//    bool noExpiroCodigo = true;
//    if (coincideCodigo || noExpiroCodigo){
//      await this.autenticar(email: this.usuario.correo, password: this.usuario.password);
//      return true;
//    }else {
//      return false;
//    }
  return true;
  }

  Future<void> registrarUsuario(
      UsuarioEntidad nuevoUsuario,
      ) async {
    await Future.delayed(Duration(seconds: 1));
    // La API debe retornar el codigo de confirmacion
    this.usuario = nuevoUsuario;
//    this.usuarioConfirmacionModelo = new UsuarioConfirmacionModelo();
//    this.usuarioConfirmacionModelo.codigo = '1234';
//    this.usuarioConfirmacionModelo.fechaExpiracion = '02/02/2021';
  }
}