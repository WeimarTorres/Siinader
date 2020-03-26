import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:siinader_pixies/pages/ingresar_notas.dart';
import 'package:siinader_pixies/pages/ver_notas_page.dart';

class NotasPage extends StatefulWidget {
  NotasPage({Key key, this.rol, this.id, this.color}) : super(key: key);
  final String rol;
  final String id;
  final Color color;
  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  int _semestreValue;
  int _idMateriaValue;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _codigoEstudianteValue;
  @override
  void initState() {
    super.initState();
    _codigoEstudianteValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/notas.jpg',
                height: 400,
              ),
              widget.rol == 'estudiantes'
                  ? Column(
                      children: <Widget>[
                        Text(
                          'MIS NOTAS',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        DropdownButton(
                          items: [
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text(
                                'PRIMER SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 2,
                              child: Text(
                                'SEGUNDO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 3,
                              child: Text(
                                'TERCER SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 4,
                              child: Text(
                                'CUARTO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 5,
                              child: Text(
                                'QUINTO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 6,
                              child: Text(
                                'SEXTO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 7,
                              child: Text(
                                'SÉPTIMO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            DropdownMenuItem<int>(
                              value: 8,
                              child: Text(
                                'OCTAVO SEMESTRE',
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (int value) {
                            setState(() {
                              _semestreValue = value;
                            });
                          },
                          hint: Text(
                            'SEMESTRE',
                          ),
                          value: _semestreValue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, right: 10.0),
                              child: Container(
                                height: 45.0,
                                width: 400.0,
                                child: Center(
                                  child: Text(
                                    'MATERIA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.amber[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, left: 10.0, right: 4.0),
                              child: Container(
                                height: 45.0,
                                width: 100.0,
                                child: Center(
                                  child: Text(
                                    '1P',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.amber[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, left: 4.0, right: 4.0),
                              child: Container(
                                height: 45.0,
                                width: 100.0,
                                child: Center(
                                  child: Text(
                                    '2P',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.amber[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, left: 4.0, right: 10.0),
                              child: Container(
                                height: 45.0,
                                width: 100.0,
                                child: Center(
                                  child: Text(
                                    '3P',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.amber[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2.0, left: 10.0),
                              child: Container(
                                height: 45.0,
                                width: 100.0,
                                child: Center(
                                  child: Text(
                                    'PROMEDIO',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.amber[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              semestre(_semestreValue, widget.id, widget.color),
                        ),
                      ],
                    )
                  : widget.rol == 'docentes' ||
                          widget.rol == 'kardex' ||
                          widget.rol == 'jefeCarrera'
                      ? Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'NOTAS',
                                style: TextStyle(fontSize: 24.0),
                              ),
                            ),
                            widget.rol == 'docentes'
                                ? Column(
                                    children: <Widget>[
                                      Form(
                                        key: _formKey,
                                        child: Container(
                                          width: 400.0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: TextFormField(
                                              controller:
                                                  _codigoEstudianteValue,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'PORFAVOR INGRESA EL CÓDIGO DE ESTUDIANTE';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.supervised_user_circle,
                                                  color: Colors.grey[900],
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red[800],
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                labelText:
                                                    'CÓDIGO DE ESTUDIANTE',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900]),
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FutureBuilder(
                                        future: getMateriasDocente(widget.id),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          return snapshot.hasData
                                              ? DropdownButton<int>(
                                                  items: snapshot.data,
                                                  onChanged: (int value) {
                                                    setState(() {
                                                      _idMateriaValue = value;
                                                    });
                                                  },
                                                  hint: Text(
                                                    'MATERIA',
                                                  ),
                                                  value: _idMateriaValue,
                                                )
                                              : CircularProgressIndicator();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: RaisedButton(
                                          color: Colors.orange[900],
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 120.0,
                                                vertical: 20.0),
                                            child: Text('INGRESAR NOTAS'),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              print(_codigoEstudianteValue);
                                              ingresar(
                                                  context,
                                                  _idMateriaValue.toString(),
                                                  _codigoEstudianteValue.text);
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    children: <Widget>[
                                      Form(
                                        key: _formKey,
                                        child: Container(
                                          width: 400.0,
                                          child: TextFormField(
                                            controller: _codigoEstudianteValue,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'PORFAVOR INGRESA EL CÓDIGO DE ESTUDIANTE';
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.supervised_user_circle,
                                                color: Colors.grey[900],
                                              ),
                                              errorStyle: TextStyle(
                                                color: Colors.red[800],
                                                fontWeight: FontWeight.w300,
                                              ),
                                              labelText: 'CÓDIGO DE ESTUDIANTE',
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]),
                                              ),
                                            ),
                                            style: TextStyle(
                                              color: Colors.grey[900],
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: RaisedButton(
                                          color: widget.color,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 135.0,
                                                      vertical: 15.0),
                                              child: Text(
                                                'VER NOTAS',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              print(_codigoEstudianteValue);
                                              ver(context,
                                                  _codigoEstudianteValue.text,widget.color);
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                          ],
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Widget>> getNotas(int semestre, String id, Color color) async {
  String url = 'http://localhost:3000/api/estudiantes/' + id + '/materias';
  List data;
  http.Response response;
  try {
    response = await http.get(url);
    data = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
  List<Widget> list = [];
  data.forEach((materia) => semestre == materia['semestre_cursada']
      ? list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, right: 10.0),
                child: Container(
                  height: 45.0,
                  width: 400.0,
                  child: Center(
                    child: Text(
                      materia['nombre'],
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
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 2.0, left: 10.0, right: 4.0),
                child: Container(
                  height: 45.0,
                  width: 100.0,
                  child: Center(
                    child: Text(
                      materia['nota1er'].toString(),
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
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 2.0, left: 4.0, right: 4.0),
                child: Container(
                  height: 45.0,
                  width: 100.0,
                  child: Center(
                    child: Text(
                      materia['nota2do'].toString(),
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
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 2.0, left: 4.0, right: 10.0),
                child: Container(
                  height: 45.0,
                  width: 100.0,
                  child: Center(
                    child: Text(
                      materia['nota3er'].toString(),
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
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, left: 10.0),
                child: Container(
                  height: 45.0,
                  width: 100.0,
                  child: Center(
                    child: Text(
                      ((materia['nota1er'] +
                                  materia['nota2do'] +
                                  materia['nota3er']) /
                              3)
                          .round()
                          .toString(),
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
              ),
            ],
          ),
        )
      : print(''));
  return list;
}

Widget semestre(int semestreValue, String id, Color color) {
  Widget semestre;
  switch (semestreValue) {
    case 1:
      semestre = FutureBuilder(
        future: getNotas(1, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 2:
      semestre = FutureBuilder(
        future: getNotas(2, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 3:
      semestre = FutureBuilder(
        future: getNotas(3, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 4:
      semestre = FutureBuilder(
        future: getNotas(4, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 5:
      semestre = FutureBuilder(
        future: getNotas(5, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 6:
      semestre = FutureBuilder(
        future: getNotas(6, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 7:
      semestre = FutureBuilder(
        future: getNotas(7, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    case 8:
      semestre = FutureBuilder(
        future: getNotas(8, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
    default:
      semestre = FutureBuilder(
        future: getNotas(1, id, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: snapshot.data.isNotEmpty
                      ? snapshot.data
                      : [Text('NO EXISTEN DATOS')],
                )
              : CircularProgressIndicator();
        },
      );
      break;
  }
  return semestre;
}

Future<List<DropdownMenuItem<int>>> getMateriasDocente(String id) async {
  String url = 'http://localhost:3000/api/docentes/' + id + '/materias';
  List data;
  http.Response response;
  try {
    response = await http.get(url);
    data = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
  List<DropdownMenuItem<int>> items = [];
  data.forEach((materia) => items.add(
        DropdownMenuItem<int>(
          value: materia['idMateria'],
          child: Text(
            materia['nombre'],
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 13.0,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ));
  return items;
}

ingresar(BuildContext context, String idMateria, String idEstudiante) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return IngresarNotasPage(
        idMateria: idMateria,
        idEstudiante: idEstudiante,
      );
    },
  );
}

ver(BuildContext context, String idEstudiante,Color color) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return VerNotasPage(
        idEstudiante: idEstudiante,color: color,
      );
    },
  );
}
