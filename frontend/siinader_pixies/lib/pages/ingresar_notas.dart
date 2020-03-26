import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IngresarNotasPage extends StatefulWidget {
  IngresarNotasPage({Key key, this.idMateria, this.idEstudiante})
      : super(key: key);
  final String idMateria;
  final String idEstudiante;
  @override
  _IngresarNotasPageState createState() => _IngresarNotasPageState();
}

class _IngresarNotasPageState extends State<IngresarNotasPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nota1erValue;
  TextEditingController _nota2doValue;
  TextEditingController _nota3erValue;
  @override
  void initState() {
    super.initState();
    _nota1erValue = TextEditingController(text: '');
    _nota2doValue = TextEditingController(text: '');
    _nota3erValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('INGRESAR NOTAS'),
      content: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: FutureBuilder(
              future: getNotas(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _nota1erValue,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'PORFAVOR INGRESA LA NOTA DEL PRIMER PARCIAL';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.w300,
                                ),
                                labelText: 'PRIMER PARCIAL',
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 13.0,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _nota2doValue,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'PORFAVOR INGRESA LA NOTA DEL SEGUNDO PARCIAL';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.w300,
                                ),
                                labelText: 'SEGUNDO PARCIAL',
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 13.0,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _nota3erValue,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'PORFAVOR INGRESA LA NOTA DEL TERCER PARCIAL';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.w300,
                                ),
                                labelText: 'TERCER PARCIAL',
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 13.0,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Colors.orange[900],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 20.0),
                                child: Text(
                                  'INGRESAR',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  String url =
                                      'http://localhost:3000/api/docentes/notas/' +
                                          widget.idEstudiante +
                                          '/' +
                                          widget.idMateria;
                                  dynamic data;
                                  var body = {
                                    'idEstudiante': widget.idEstudiante,
                                    'idMateria': widget.idMateria,
                                    'nota1er': _nota1erValue.text,
                                    'nota2do': _nota2doValue.text,
                                    'nota3er': _nota3erValue.text
                                  };
                                  var bodyEncoded = json.encode(body);
                                  http.Response response;
                                  try {
                                    response = await http.put(url,
                                        body: bodyEncoded,
                                        headers: {
                                          "Accept": "application/json",
                                          "Content-Type": "application/json"
                                        });
                                    data = response.body;
                                  } catch (e) {
                                    print(e);
                                  }
                                  if (data
                                      .toString()
                                      .contains('"affectedRows":1')) {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      )
                    : Center(child: CircularProgressIndicator());
              },
            )),
      ),
    );
  }

  Future<List> getNotas() async {
    String url = 'http://localhost:3000/api/docentes/notas/' +
        widget.idEstudiante +
        '/' +
        widget.idMateria;
    dynamic data;
    http.Response response;
    try {
      response = await http.get(url);
      data = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    print(data[0]['nota1er'].toString());
    _nota1erValue.text = data[0]['nota1er'].toString();
    _nota2doValue.text = data[0]['nota2do'].toString();
    _nota3erValue.text = data[0]['nota3er'].toString();
    return [];
  }
}
