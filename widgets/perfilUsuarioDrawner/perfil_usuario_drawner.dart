import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_event.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_state.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/entidades/usuario_entidad.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';

class PerfilUsuarioDrawner extends StatelessWidget {

  final UsuarioEntidad usuario;
  PerfilUsuarioDrawner({@required this.usuario});

  Widget generarCabeceraDrawner() {
    final cabecerarDrawner = UserAccountsDrawerHeader(
      accountEmail: Text(this.usuario.correo),
      accountName: Text(
          this.usuario.perfil.nombres + '\n' + this.usuario.perfil.apellidos),
      currentAccountPicture: CircleAvatar(
        radius: 10,
        child: CachedNetworkImage(
          imageUrl: 'https://i.dlpng.com/static/png/6646535_preview.png',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        backgroundColor: Colors.white,
      ),
    );
    return cabecerarDrawner;
  }
  bool escucharTema(PreferenciasState estado){
    if (estado is TemaCambiado){
        if (estado.temaColor == Brightness.light ){
          return false;
        }
        return true;
    }
    return false;
  }

  _accionarBotonCambiarTema(BuildContext context) {
    return (bool valor) {
      Brightness tema = Brightness.light;
      // this.cambioTemaOscuro = valor;
      if (valor) {
        tema = Brightness.dark;
      }
      BlocProvider.of<PreferenciasBloc>(context).add(
        CambioTemaEvent(colorTema: tema),
      );
    };
  }

  Widget generarItemsDrawner(AppLocalizations traductor, BuildContext context) {
    return BlocBuilder<PreferenciasBloc, PreferenciasState>(
      builder: (context, state) {
        return ListView(
          children: <Widget>[
            generarCabeceraDrawner(),
            ListTile(
              leading: Icon(Icons.brightness_5),
              title:
                  Text(traductor.translateText('drawner.opciones.modoOscuro')),
              trailing: Switch(
                value: this.escucharTema(state),
                onChanged: this._accionarBotonCambiarTema(context),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(traductor.translateText('drawner.opciones.perfil')),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(traductor.translateText('drawner.opciones.acerca')),
              onTap: () {},
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations traductor = AppLocalizations.of(context);
    return Drawer(
      child: generarItemsDrawner(traductor, context),
    );
  }
}
