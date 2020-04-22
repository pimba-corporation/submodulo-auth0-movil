import 'package:meta/meta.dart';

class PerfilUsuarioEntidad{
  int id;
  String nombres;
  String apellidos;
  String telefono1;
  String telefono2;
  String fechaNacimiento;

  PerfilUsuarioEntidad({
    @required this.nombres,
    @required this.apellidos,
    @required this.telefono1,
    @required this.telefono2,
    @required this.fechaNacimiento,
    this.id,
  });
}