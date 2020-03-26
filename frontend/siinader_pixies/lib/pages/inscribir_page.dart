import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InscribirPage extends StatefulWidget {
  @override
  _InscribirPageState createState() => _InscribirPageState();
}

class _InscribirPageState extends State<InscribirPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _codigoEstudianteValue;
  int _semestreValue;
  String _aulaValue;
  int _idMateriaValue;
  int _horaValue;
  @override
  void initState() {
    super.initState();
    _codigoEstudianteValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('INSCRIBIR ESTUDIANTE A MATERIA'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 13.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              FutureBuilder(
                future: getMaterias(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? DropdownButton(
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
              DropdownButton(
                items: [
                  DropdownMenuItem<String>(
                    value: 'A1',
                    child: Text(
                      'A1',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A2',
                    child: Text(
                      'A2',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A3',
                    child: Text(
                      'A3',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A4',
                    child: Text(
                      'A4',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A5',
                    child: Text(
                      'A5',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A6',
                    child: Text(
                      'A6',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A7',
                    child: Text(
                      'A7',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A8',
                    child: Text(
                      'A8',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A9',
                    child: Text(
                      'A9',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'A10',
                    child: Text(
                      'A10',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    _aulaValue = value;
                  });
                },
                hint: Text(
                  'AULA',
                ),
                value: _aulaValue,
              ),
              DropdownButton(
                items: [
                  DropdownMenuItem<int>(
                    value: 8,
                    child: Text(
                      '8:00',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 10,
                    child: Text(
                      '10:00',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 12,
                    child: Text(
                      '12:00',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 14,
                    child: Text(
                      '14:00',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 13.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 16,
                    child: Text(
                      '16:00',
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
                    _horaValue = value;
                  });
                },
                hint: Text(
                  'HORA',
                ),
                value: _horaValue,
              ),
              RaisedButton(
                color: Colors.blue[400],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:80.0,vertical: 20.0),
                  child: Text(
                    'INSCRIBIR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print(_codigoEstudianteValue.text);
                    String url =
                        'http://localhost:3000/api/jefeCarrera/inscripcion';
                    dynamic data;
                    var body = {
                      'estudiante_idEstudiante': _codigoEstudianteValue.text,
                      'materia_idMateria': _idMateriaValue.toString(),
                      'semestre_cursada': _semestreValue.toString(),
                      'aula': _aulaValue,
                      'hora_inicio': _horaValue.toString()
                    };
                    var bodyEncoded = json.encode(body);
                    http.Response response;
                    try {
                      response = await http.post(url,
                          body: bodyEncoded,
                          headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                          });
                      data = response.body;
                    } catch (e) {
                      print(e);
                    }
                    print(data);
                    if (data.toString().contains('"affectedRows":1')) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<DropdownMenuItem<int>>> getMaterias() async {
  String url = 'http://localhost:3000/api/materias';
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
