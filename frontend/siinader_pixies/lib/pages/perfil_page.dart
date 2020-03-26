import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key, this.rol, this.id, this.color}) : super(key: key);
  final String rol;
  final String id;
  final Color color;
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                future: getDatos(widget.id, widget.rol, widget.color),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: snapshot.data,
                        )
                      : CircularProgressIndicator();
                },
              ),
            ],
          ),
          Image.asset(
            'assets/images/perfil.png',
            height: 400.0,
          ),
        ],
      ),
    );
  }
}

Future<List<Widget>> getDatos(String id, String rol, Color color) async {
  String idTabla;
  switch (rol) {
    case 'estudiantes':
      idTabla = 'idEstudiante';
      break;
    case 'docentes':
      idTabla = 'idDocente';
      break;
    case 'kardex':
      idTabla = 'idKardex';
      break;
    case 'jefeCarrera':
      idTabla = 'idJefeCarrera';
      break;
  }
  String url = 'http://localhost:3000/api/' + rol + '/' + id;
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
    (perfil) => list.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0, left: 100.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Text(
                      'MI PERFIL',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Text('NOMBRE:'),
                Container(
                  width: 400.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      perfil['nombre'] +
                          ' ' +
                          perfil['apellido_1'] +
                          ' ' +
                          perfil['apellido_2'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2.0),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0, left: 100.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Text('CI:'),
                Container(
                  width: 400.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      perfil['ci'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2.0),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0, left: 100.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Text('CÓDIGO:'),
                Container(
                  width: 400.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      perfil[idTabla].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2.0),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0, left: 100.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Text('FECHA DE NACIMIENTO:'),
                Container(
                  width: 400.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      perfil['fecha_nacimiento'].toString().substring(0, 10),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2.0),
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return list;
}
