import '../../domain/domain.dart';

class ReservationRepositoryImpl extends ReservationRepository {

  final ReservationDatasource reservationDatasource;

  ReservationRepositoryImpl( this.reservationDatasource );
  
  @override
  Future<Reservation> createUpdateReservation(Map<String, dynamic> reservationSimilar) {
    return reservationDatasource.createUpdateReservation(reservationSimilar);
  }
  
  @override
  Future<void> deleteReservation(String id) {
    return reservationDatasource.deleteReservation(id);
  }
  
  @override
  Future<Reservation> getReservationById(String id) {
    return reservationDatasource.getReservationById(id);
  }
  
  @override
  Future<List<Reservation>> getReservations() {
    return reservationDatasource.getReservations(); 
  }


 
}
