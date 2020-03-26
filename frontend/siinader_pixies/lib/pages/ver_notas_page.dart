import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerNotasPage extends StatefulWidget {
  VerNotasPage({Key key, this.idEstudiante, this.color}) : super(key: key);
  final String idEstudiante;
  final Color color;
  @override
  _VerNotasPageState createState() => _VerNotasPageState();
}

class _VerNotasPageState extends State<VerNotasPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('NOTAS DEL ESTUDIANTE'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                        'MATERIA',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white,
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
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white,
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
                        '2P',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white,
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
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white,
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
                        'PROMEDIO',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: getNotas(widget.idEstudiante, widget.color),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? snapshot.data
                      : CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Widget> getNotas(String id, Color color) async {
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
  data.forEach(
    (materia) => list.add(
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
            padding: const EdgeInsets.only(bottom: 2.0, left: 10.0, right: 4.0),
            child: Container(
              height: 45.0,
              width: 100.0,
              child: Center(
                child: Text(
                  materia['nota1er'].toString(),
                  style: TextStyle(
                    color: Colors.white,
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
            padding: const EdgeInsets.only(bottom: 2.0, left: 4.0, right: 4.0),
            child: Container(
              height: 45.0,
              width: 100.0,
              child: Center(
                child: Text(
                  materia['nota2do'].toString(),
                  style: TextStyle(
                    color: Colors.white,
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
            padding: const EdgeInsets.only(bottom: 2.0, left: 4.0, right: 10.0),
            child: Container(
              height: 45.0,
              width: 100.0,
              child: Center(
                child: Text(
                  materia['nota3er'].toString(),
                  style: TextStyle(
                    color: Colors.white,
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
    ),
  );
  return Column(
    children: list.isNotEmpty ? list : [Text('NO EXISTEN DATOS')],
  );
}
