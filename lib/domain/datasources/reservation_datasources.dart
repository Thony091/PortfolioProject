import '../domain.dart';

abstract class ReservationDatasource {
  
  Future<List<Reservation>> getReservations();
  Future<Reservation> getReservationById( String id );
  Future<Reservation> createUpdateReservation( Map<String, dynamic> reservationSimilar );
  Future<void> deleteReservation( String id );
  
}