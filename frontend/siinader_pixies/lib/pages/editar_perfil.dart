import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditarPerfilPage extends StatefulWidget {
  EditarPerfilPage({Key key, this.id, this.rol, this.color}) : super(key: key);
  final String id;
  final String rol;
  final Color color;
  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nombreValue;
  TextEditingController _apellido1Value;
  TextEditingController _apellido2Value;
  TextEditingController _fechaNacimientoValue;
  TextEditingController _passwordValue;

  @override
  void initState() {
    super.initState();
    _nombreValue = TextEditingController(text: '');
    _apellido1Value = TextEditingController(text: '');
    _apellido2Value = TextEditingController(text: '');
    _fechaNacimientoValue = TextEditingController(text: '');
    _passwordValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('EDITAR PERFIL'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: FutureBuilder(
                future: getDatos(widget.id, widget.rol),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _nombreValue,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PORFAVOR INGRESA EL NOMBRE DEL USUARIO';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w300,
                                  ),
                                  labelText: 'NOMBRE',
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
                                controller: _apellido1Value,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PORFAVOR INGRESA EL PRIMER APELLIDO';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w300,
                                  ),
                                  labelText: 'PRIMER APELLIDO',
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
                                controller: _apellido2Value,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PORFAVOR INGRESA EL SEGUNDO APELLIDO';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w300,
                                  ),
                                  labelText: 'SEGUNDO APELLIDO',
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
                                controller: _fechaNacimientoValue,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PORFAVOR INGRESA LA FECHA DE NACIMIENTO';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w300,
                                  ),
                                  labelText: 'FECHA DE NACIMIENTO',
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
                                obscureText: true,
                                controller: _passwordValue,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'PORFAVOR INGRESA LA CONTRASEÑA';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.w300,
                                  ),
                                  labelText: 'CONTRASEÑA',
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
                                color: widget.color,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0, vertical: 10.0),
                                  child: Text(
                                    'EDITAR',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    String url = 'http://localhost:3000/api/' +
                                        widget.rol +
                                        '/' +
                                        widget.id;
                                    dynamic data;
                                    var body = {
                                      'nombre': _nombreValue.text,
                                      'apellido_1': _apellido1Value.text,
                                      'apellido_2': _apellido2Value.text,
                                      'fecha_nacimiento':
                                          _fechaNacimientoValue.text,
                                      'password': _passwordValue.text
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
                                      print(data);
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
                            ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List> getDatos(String id, String rol) async {
    String url = 'http://localhost:3000/api/' + rol + '/' + id;
    dynamic data;
    List list = [];
    http.Response response;
    try {
      response = await http.get(url);
      data = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    _nombreValue.text = data[0]['nombre'];
    _apellido1Value.text = data[0]['apellido_1'];
    _apellido2Value.text = data[0]['apellido_2'];
    _fechaNacimientoValue.text = data[0]['fecha_nacimiento'].substring(0, 10);
    _passwordValue.text = data[0]['password'];
    print(list);
    return list;
  }
}
