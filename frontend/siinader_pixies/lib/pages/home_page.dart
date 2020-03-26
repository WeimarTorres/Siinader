import 'package:flutter/material.dart';
import 'package:siinader_pixies/pages/editar_perfil.dart';
import 'package:siinader_pixies/pages/inicio_page.dart';
import 'package:siinader_pixies/pages/login_page.dart';
import 'package:siinader_pixies/pages/materias_page.dart';
import 'package:siinader_pixies/pages/notas_page.dart';
import 'package:siinader_pixies/pages/perfil_page.dart';
import 'package:siinader_pixies/pages/plan_de_estudios_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.rol, this.id, this.name}) : super(key: key);
  final String rol;
  final String name;
  final String id;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(initialPage: 0, keepPage: true);
  Color color;
  @override
  void initState() {
    switch (widget.rol) {
      case 'estudiantes':
        color = Colors.amber[600];
        break;
      case 'docentes':
        color = Colors.orange[900];
        break;
      case 'kardex':
        color = Colors.green[400];
        break;
      case 'jefeCarrera':
        color = Colors.blue[400];
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'SIINADER',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.0),
              color: color,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Inicio',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              });
            },
          ),
          InkWell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Materias',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              });
            },
          ),
          InkWell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Plan de Estudios',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              });
            },
          ),
          InkWell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Notas',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                pageController.animateToPage(
                  3,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              });
            },
          ),
          InkWell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Perfil',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                pageController.animateToPage(
                  4,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              });
            },
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey[900],
            ),
            tooltip: 'Configuración',
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Editar Perfil'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Cerrar Sesión'),
              ),
            ],
            onSelected: (value) {
              value == 1
                  ? editarPerfil(context, widget.id, widget.rol,color)
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
            },
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          InicioPage(
            rol: widget.rol,
            nombre: widget.name,
            color: color,
          ),
          MateriasPage(rol: widget.rol, id: widget.id, color: color),
          PlanEstudios(color: color),
          NotasPage(rol: widget.rol, id: widget.id, color: color),
          PerfilPage(rol: widget.rol, id: widget.id,color: color),
        ],
      ),
    );
  }
}

editarPerfil(BuildContext context, String id, String rol,Color color) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return EditarPerfilPage(
        id: id,
        rol: rol,
        color: color,
      );
    },
  );
}
