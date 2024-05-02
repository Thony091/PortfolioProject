import 'package:portafolio_project/infrastructure/models/userdb_response.dart';

import '../../domain/domain.dart';

class USerMapper {

  static User userDbToEntity( UserDbResponse userDb) => User(
    id: userDb.idUser,
    nombre: userDb.nombre,
    rut: userDb.rut,
    fechaNacimiento: userDb.fechaNacimiento,
    email: userDb.email,
    telefono: userDb.telefono,
    direccion: userDb.direccion,
    password: userDb.contrasenia, 
    roles: [],
  );
}
