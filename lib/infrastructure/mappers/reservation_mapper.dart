import '../../domain/domain.dart';


class ReservationMapper {

  static jsonToEntity( Map<String, dynamic> json) => Reservation(
    id: json['id'].toString(), 
    name: json['name'],
    rut: json['rut'],
    email: json['email'],
    reservationDate: json['reservationDate'],
    reservationTime: json['reservationTime'],
    serviceName: json['serviceName'],
  );
}