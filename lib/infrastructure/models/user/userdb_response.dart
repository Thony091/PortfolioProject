
class UserDbResponse {
    final int idUser;
    final String nombre;
    final String rut;
    final String fechaNacimiento;
    final String email;
    final String telefono;
    final String direccion;
    final String contrasenia;

    UserDbResponse({
        required this.idUser,
        required this.nombre,
        required this.rut,
        required this.fechaNacimiento,
        required this.email,
        required this.telefono,
        required this.direccion,
        required this.contrasenia,
    });

    factory UserDbResponse.fromJson(Map<String, dynamic> json) => UserDbResponse(
        idUser: json["idUser"],
        nombre: json["nombre"],
        rut: json["rut"] ?? '',
        fechaNacimiento: json["fechaNacimiento"] ?? '',
        email: json["email"] ?? '',
        telefono: json["telefono"] ?? '',
        direccion: json["direccion"] ?? '',
        contrasenia: json["contraseña"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "nombre": nombre,
        "rut": rut,
        "fechaNacimiento": fechaNacimiento,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "contraseña": contrasenia,
    };
}
