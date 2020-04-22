import 'package:meta/meta.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/entidades/perfilUsuario_entidad.dart';

class UsuarioEntidad{
  int id;
  String correo;
  PerfilUsuarioEntidad perfil;

  UsuarioEntidad({
    @required this.correo,
    @required this.perfil,
    this.id,
  });
}