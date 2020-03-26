const express = require("express");
const mysql = require("mysql");
const app = express();
const cors = require("cors");
const swaggerUi = require("swagger-ui-express");
const swaggerDocument = require("./swagger.json");
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "123456789",
    database: "siinader"
});
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

connection.connect(err => {
    if (err) {
        console.log(err);
    } else {
        console.log('Connected to the MySQL server');
    }
});

app.set('port', 3000);
app.use(express.json());
app.use(cors({ origin: true, credentials: true }));

//imprime siinader
app.get('/api', (req, res) => res.send('SIINADER'));

//obtener todos los estudiantes o uno solo
app.get('/api/estudiantes', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM estudiantes', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener un estudiante
app.get('/api/estudiantes/:id', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM estudiantes WHERE idEstudiante = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });

});
//crear estudiante
app.post('/api/estudiantes', (req, res) => {
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var ci = req.body.ci;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('INSERT INTO estudiantes (nombre,apellido_1,apellido_2,ci,fecha_nacimiento,password) VALUES (?,?,?,?,?,?)', [nombre, apellido_1, apellido_2, ci, fecha_nacimiento, password], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//actualizar datos de estudiante
app.put('/api/estudiantes/:id', (req, res) => {
    var id = req.params.id;
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('UPDATE estudiantes SET nombre = ' + "'" + nombre + "'" + ',apellido_1 =' + "'" + apellido_1 + "'" + ', apellido_2 = ' + "'" + apellido_2 + "'" + ', fecha_nacimiento = ' + "'" + fecha_nacimiento + "'" + ', password  = ' + "'" + password + "'" + ' WHERE idEstudiante = ' + id, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//eliminar estudiante
app.delete('/api/estudiantes/:id', (req, res) => {
    var id = req.params.id;
    connection.query('DELETE FROM estudiantes WHERE idEstudiante = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener todos los docentes
app.get('/api/docentes', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM docentes', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener un docente
app.get('/api/docentes/:id', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM docentes WHERE idDocente = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//crear docente
app.post('/api/docentes', (req, res) => {
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var ci = req.body.ci;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('INSERT INTO docentes (nombre,apellido_1,apellido_2,ci,fecha_nacimiento,password) VALUES (?,?,?,?,?,?)', [nombre, apellido_1, apellido_2, ci, fecha_nacimiento, password], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//actualizar datos de docente
app.put('/api/docentes/:id', (req, res) => {
    var id = req.params.id;
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('UPDATE docentes SET nombre = ' + "'" + nombre + "'" + ',apellido_1 =' + "'" + apellido_1 + "'" + ', apellido_2 = ' + "'" + apellido_2 + "'" + ', fecha_nacimiento = ' + "'" + fecha_nacimiento + "'" + ', password  = ' + "'" + password + "'" + ' WHERE idDocente = ' + id, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//eliminar docente
app.delete('/api/docentes/:id', (req, res) => {
    var id = req.params.id;
    connection.query('DELETE FROM docentes WHERE idDocente = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener todas las materias
app.get('/api/materias', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM materias', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener una materia
app.get('/api/materias/:id', (req, res) => {
    var id = req.params.id;

    connection.query('SELECT * FROM materias WHERE idMateria = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener las materias y notas de un estudiante
app.get('/api/estudiantes/:id/materias', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT nombre,idMateria,nota1er,nota2do,nota3er,semestre_cursada,aula,hora_inicio FROM estudiante_has_materia,materias WHERE estudiante_idEstudiante = ' + id + ' && materia_idMateria=idMateria', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//inscribir estudiante a materia
app.post('/api/jefeCarrera/inscripcion', (req, res) => {
    var estudiante_idEstudiante = req.body.estudiante_idEstudiante;
    var materia_idMateria = req.body.materia_idMateria;
    var semestre_cursada = req.body.semestre_cursada;
    var aula = req.body.aula;
    var hora_inicio = req.body.hora_inicio;
    connection.query('INSERT INTO estudiante_has_materia (estudiante_idEstudiante,materia_idMateria,semestre_cursada,aula,hora_inicio) VALUES ("' + estudiante_idEstudiante + '","' + materia_idMateria + '","' + semestre_cursada + '","' + aula + '","' + hora_inicio + '")', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//asignar docente a materia
app.post('/api/jefeCarrera/asignacion', (req, res) => {
    var docente_idDocente = req.body.docente_idDocente;
    var materias_idMateria = req.body.materias_idMateria;
    var aula = req.body.aula;
    var hora_inicio = req.body.hora_inicio;
    connection.query('INSERT INTO docente_has_materia (docente_idDocente,materias_idMateria,aula,hora_inicio) VALUES ("' + docente_idDocente + '","' + materias_idMateria + '","' + aula + '","' + hora_inicio + '")', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener notas de la materia de un estudiante
app.get('/api/docentes/notas/:idEstudiante/:idMateria', (req, res) => {
    var idEstudiante = req.params.idEstudiante;
    var idMateria = req.params.idMateria;
    connection.query('SELECT nota1er,nota2do,nota3er FROM estudiante_has_materia WHERE estudiante_idEstudiante =' + idEstudiante + '&& materia_idMateria = ' + idMateria, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//ingresar notas a un estudiante
app.put('/api/docentes/notas/:idEstudiante/:idMateria', (req, res) => {
    var idEstudiante = req.params.idEstudiante;
    var idMateria = req.params.idMateria;
    var nota1er = req.body.nota1er;
    var nota2do = req.body.nota2do;
    var nota3er = req.body.nota3er;
    connection.query('UPDATE estudiante_has_materia SET nota1er = ' + "'" + nota1er + "'" + ',nota2do =' + "'" + nota2do + "'" + ', nota3er = ' + "'" + nota3er + "'" + ' WHERE estudiante_idEstudiante = ' + idEstudiante + '&& materia_idMateria = ' + idMateria, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener las materias que un docente dicta
app.get('/api/docentes/:id/materias', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT idDocente,idMateria,aula,hora_inicio, materias.nombre,docentes.nombre as docente_nombre ,docentes.apellido_1,docentes.apellido_2 FROM docente_has_materia,materias,docentes WHERE docente_idDocente =' + id + ' && idMateria=materias_idMateria && idDocente=docente_idDocente', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener todas las materias que los docentes dictan
app.get('/api/kardex/materias', (req, res) => {
    connection.query('SELECT idDocente,idMateria, materias.nombre,docentes.nombre as docente_nombre ,docentes.apellido_1,docentes.apellido_2 FROM docente_has_materia,materias,docentes WHERE idMateria=materias_idMateria && idDocente=docente_idDocente', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener todos los kardex o uno solo
app.get('/api/kardex', (req, res) => {
    connection.query('SELECT * FROM kardex', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
app.get('/api/kardex/:id', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM kardex WHERE idKardex = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener todos los jefes de carrera
app.get('/api/jefeCarrera', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM jefes_Carrera', (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//obtener un jefe de carrera
app.get('/api/jefeCarrera/:id', (req, res) => {
    var id = req.params.id;
    connection.query('SELECT * FROM jefes_carrera WHERE idJefeCarrera = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//crear jefe de carrera
app.post('/api/jefeCarrera', (req, res) => {
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var ci = req.body.ci;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('INSERT INTO jefes_carrera (nombre,apellido_1,apellido_2,ci,fecha_nacimiento,password) VALUES (?,?,?,?,?,?)', [nombre, apellido_1, apellido_2, ci, fecha_nacimiento, password], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//crear kardex
app.post('/api/kardex', (req, res) => {
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var ci = req.body.ci;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('INSERT INTO kardex (nombre,apellido_1,apellido_2,ci,fecha_nacimiento,password) VALUES (?,?,?,?,?,?)', [nombre, apellido_1, apellido_2, ci, fecha_nacimiento, password], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//eliminar kardex
app.delete('/api/kardex/:id', (req, res) => {
    var id = req.params.id;
    connection.query('DELETE FROM kardex WHERE idKardex = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//eliminar jefe de carrera
app.delete('/api/jefeCarrera/:id', (req, res) => {
    var id = req.params.id;
    connection.query('DELETE FROM jefes_carrera WHERE idJefeCarrera = ?', [id], (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//actualizar datos de un kardex
app.put('/api/kardex/:id', (req, res) => {
    var id = req.params.id;
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('UPDATE kardex SET nombre = ' + "'" + nombre + "'" + ',apellido_1 =' + "'" + apellido_1 + "'" + ', apellido_2 = ' + "'" + apellido_2 + "'" + ', fecha_nacimiento = ' + "'" + fecha_nacimiento + "'" + ', password  = ' + "'" + password + "'" + ' WHERE idKardex = ' + id, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});
//actualizar datos de un jefe de carrera
app.put('/api/jefeCarrera/:id', (req, res) => {
    var id = req.params.id;
    var nombre = req.body.nombre;
    var apellido_1 = req.body.apellido_1;
    var apellido_2 = req.body.apellido_2;
    var fecha_nacimiento = req.body.fecha_nacimiento;
    var password = req.body.password;
    connection.query('UPDATE jefes_carrera SET nombre = ' + "'" + nombre + "'" + ',apellido_1 =' + "'" + apellido_1 + "'" + ', apellido_2 = ' + "'" + apellido_2 + "'" + ', fecha_nacimiento = ' + "'" + fecha_nacimiento + "'" + ', password  = ' + "'" + password + "'" + ' WHERE idJefeCarrera = ' + id, (err, results) => {
        if (err) {
            return res.send(err);
        } else {
            return res.send(results);
        }
    });
});

app.listen(app.get('port'), () => console.log('Start server on port ' + app.get('port')));