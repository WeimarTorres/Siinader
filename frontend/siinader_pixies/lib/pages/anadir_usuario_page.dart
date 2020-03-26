import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnadirUsuarioPage extends StatefulWidget {
  @override
  _AnadirUsuarioPageState createState() => _AnadirUsuarioPageState();
}

class _AnadirUsuarioPageState extends State<AnadirUsuarioPage> {
  String _rolValue;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nombreValue;
  TextEditingController _apellido1Value;
  TextEditingController _apellido2Value;
  TextEditingController _ciValue;
  TextEditingController _fechaNacimientoValue;
  TextEditingController _passwordValue;

  @override
  void initState() {
    super.initState();
    _nombreValue = TextEditingController(text: '');
    _apellido1Value = TextEditingController(text: '');
    _apellido2Value = TextEditingController(text: '');
    _ciValue = TextEditingController(text: '');
    _fechaNacimientoValue = TextEditingController(text: '');
    _passwordValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('AÑADIR USUARIO'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  value: 'estudiantes',
                  child: Text(
                    'ESTUDIANTE',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'docentes',
                  child: Text(
                    'DOCENTE',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'kardex',
                  child: Text(
                    'KARDEX',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 13.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'jefeCarrera',
                  child: Text(
                    'JEFE DE CARRERA',
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
                  _rolValue = value;
                });
              },
              hint: Text(
                'USUARIO',
              ),
              value: _rolValue,
            ),
            Form(
              key: _formKey,
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _ciValue,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'PORFAVOR INGRESA EL CI';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.red[800],
                          fontWeight: FontWeight.w300,
                        ),
                        labelText: 'CARNET DE IDENTIDAD',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.green[400],
                      child: Text('AÑADIR',style: TextStyle(color: Colors.white),),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          String url = 'http://localhost:3000/api/' + _rolValue;
                          dynamic data;
                          var body = {
                            'nombre':_nombreValue.text,
                            'apellido_1':_apellido1Value.text,
                            'apellido_2':_apellido2Value.text,
                            'ci':_ciValue.text,
                            'fecha_nacimiento':_fechaNacimientoValue.text,
                            'password':_passwordValue.text
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
                          if (data.toString().contains('"affectedRows":1')) {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}