class User{

  final int id;
  final String nombre;
  final String rut;
  final String fechaNacimiento;
  final String email;
  final String telefono;
  final String direccion;
  final String password;
  final List<String> roles;

  User({
    required this.roles,
    required this.id,
    required this.nombre, 
    required this.rut, 
    required this.fechaNacimiento, 
    required this.email, 
    required this.telefono, 
    required this.direccion, 
    required this.password
  });

  bool get isAdmin { 
    return roles.contains('admin');
  }
}