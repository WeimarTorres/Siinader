import 'package:flutter/material.dart';
import 'package:siinader_pixies/pages/anadir_usuario_page.dart';
import 'package:siinader_pixies/pages/eliminar_usuario.dart';
import 'package:siinader_pixies/pages/ver_usuarios.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key key, this.rol, this.nombre, this.color}) : super(key: key);
  final String rol;
  final String nombre;
  final Color color;
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    String rol;
    switch (widget.rol) {
      case 'estudiantes':
        rol = 'ESTUDIANTIL';
        break;
      case 'docentes':
        rol = 'DOCENTES';
        break;
      case 'kardex':
        rol = 'KARDEX';
        break;
      case 'jefeCarrera':
        rol = 'JEFE DE CARRERA';
        break;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'SIINADER - ' + rol,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
              child: Text(
                'BIENVENIDO ' + widget.nombre.toUpperCase(),
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            widget.rol == 'kardex'
                ? Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'AÑADIR USUARIO',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => anadir(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'ELIMINAR USUARIO',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => eliminar(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'VER ESTUDIANTES',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => ver(context, 'estudiantes'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'VER DOCENTES',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => ver(context, 'docentes'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'VER JEFES DE CARRERA',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => ver(context, 'jefeCarrera'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'VER KARDEX',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () => ver(context, 'kardex'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

anadir(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AnadirUsuarioPage();
    },
  );
}

ver(BuildContext context, String rol) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return VerUsuariosPage(
        rol: rol,
      );
    },
  );
}

eliminar(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return EliminarUsuarioPage();
    },
  );
}
