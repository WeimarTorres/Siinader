import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EliminarUsuarioPage extends StatefulWidget {
  @override
  _EliminarUsuarioPageState createState() => _EliminarUsuarioPageState();
}

class _EliminarUsuarioPageState extends State<EliminarUsuarioPage> {
  String _rolValue;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _codigoValue;
  @override
  void initState() {
    super.initState();
    _codigoValue = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ELIMINAR USUARIO'),
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
                  TextFormField(
                    controller: _codigoValue,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'PORFAVOR INGRESA EL CÓDIGO DEL USUARIO';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red[800],
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'CÓDIGO',
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
                  RaisedButton(
                    color: Colors.green[400],
                    child: Text(
                      'ELIMINAR',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        String url = 'http://localhost:3000/api/' +
                            _rolValue +
                            '/' +
                            _codigoValue.text;
                        print(url);
                        dynamic data;
                        http.Response response;
                        try {
                          response = await http.delete(url);
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
