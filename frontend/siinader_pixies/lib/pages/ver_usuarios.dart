import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerUsuariosPage extends StatefulWidget {
  VerUsuariosPage({Key key, this.rol}) : super(key: key);
  final String rol;
  @override
  _VerUsuariosPageState createState() => _VerUsuariosPageState();
}

class _VerUsuariosPageState extends State<VerUsuariosPage> {
  String usuarios;
  String id;
  @override
  Widget build(BuildContext context) {
    switch (widget.rol) {
      case 'estudiantes':
        usuarios = 'ESTUDIANTES';
        id = 'idEstudiante';
        break;
      case 'docentes':
        usuarios = 'DOCENTES';
        id = 'idDocente';
        break;
      case 'kardex':
        usuarios = 'KARDEX';
        id = 'idKardex';
        break;
      case 'jefeCarrera':
        usuarios = 'JEFES DE CARRERA';
        id = 'idJefeCarrera';
        break;
    }
    return AlertDialog(
      title: Text(usuarios),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: getUsuarios(widget.rol, id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? snapshot.data
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Widget> getUsuarios(String rol, String id) async {
  String url = 'http://localhost:3000/api/' + rol;
  List data;
  http.Response response;
  try {
    response = await http.get(url);
    data = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
  List<Widget> list = [];
  data.forEach(
    (usuario) => list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0, right: 10.0),
            child: Container(
              height: 40.0,
              width: 400.0,
              child: Center(
                child: Text(
                  usuario['nombre'] +
                      ' ' +
                      usuario['apellido_1'] +
                      ' ' +
                      usuario['apellido_2'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.green[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2.0,
              left: 10.0,
            ),
            child: Container(
              height: 40.0,
              width: 100.0,
              child: Center(
                child: Text(
                  usuario[id].toString(),style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.green[400],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  return Column(
    children: list,
  );
}
