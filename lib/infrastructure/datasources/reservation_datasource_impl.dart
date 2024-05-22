
import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

class ReservationDatasourceImpl extends ReservationDatasource {

  late final Dio dio;
  final String accessToken;

  ReservationDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: '${Enviroment.baseUrl}/reservation-rest',
      headers: {
        'Authorization': 'Bearer $accessToken'
      }
    )
  );

  @override
  Future<Reservation> createUpdateReservation(Map<String, dynamic> reservationSimilar) {
    // TODO: implement createUpdateReservation
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReservation(String id) {
    // TODO: implement deleteReservation
    throw UnimplementedError();
  }

  @override
  Future<Reservation> getReservationById(String id) {
    // TODO: implement getReservationById
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> getReservations() {
    // TODO: implement getReservations
    throw UnimplementedError();
  }




}