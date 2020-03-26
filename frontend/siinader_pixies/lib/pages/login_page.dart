import 'package:flutter/material.dart';
import 'package:siinader_pixies/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _rolValue;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _id;
  TextEditingController _password;
  @override
  void initState() {
    super.initState();
    _id = TextEditingController(text: '');
    _password = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      key: _key,
      appBar: AppBar(
        title: Text(
          'SIINADER',
          style: TextStyle(color: Colors.grey[900]),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.amber[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/UPEA.jpg',
                height: 200,
              ),
              Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _id,
                              validator: (value) => (value.isEmpty)
                                  ? 'PORFAVOR INGRESA TU CÓDIGO DE USUARIO'
                                  : null,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.grey[900],
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.w300,
                                ),
                                labelText: 'CÓDIGO',
                                labelStyle: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 125.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              obscureText: true,
                              controller: _password,
                              validator: (value) => (value.isEmpty)
                                  ? 'PORFAVOR INGRESA TU CONTRASEÑA'
                                  : null,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_open,
                                  color: Colors.grey[900],
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.w300,
                                ),
                                labelText: 'CONTRASEÑA',
                                labelStyle: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w300,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: RaisedButton(
                            color: Colors.amber[600],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 100.0,
                              ),
                              child: Text(
                                'INGRESAR',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                String url = 'http://localhost:3000/api/' +
                                    _rolValue +
                                    '/' +
                                    _id.text;
                                List data;
                                http.Response response;
                                try {
                                  response = await http.get(url);
                                  data = jsonDecode(response.body);
                                } catch (e) {
                                  print(e);
                                }
                                if (data.isNotEmpty) {
                                  if (data[0]['password'] == _password.text) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(
                                                rol: _rolValue,
                                                id: _id.text,
                                                name: data[0]['nombre']),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text('Algo anda mal'),
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text('Algo anda mal'),
                                      );
                                    },
                                  );
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
            ],
          ),
        ),
      ),
    );
  }
}
