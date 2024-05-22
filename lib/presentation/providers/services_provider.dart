import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

final servicesProvider = StateNotifierProvider<ServicesNotifier, ServicesState>((ref) {

  final servicesRepository = ref.watch( servicesRepositoryProvider );

  return ServicesNotifier(
    servicesRepository: servicesRepository
  );
});

class ServicesNotifier extends StateNotifier<ServicesState>{

  final ServicesRepository servicesRepository;

  ServicesNotifier({
    required this.servicesRepository
  }) : super(ServicesState()){
    getServices();
  }

  Future<void> getServices() async {

    state = state.copyWith(isLoading: true);

    try {
      
      final services = await servicesRepository.getServices();
      
      state = state.copyWith(
        services: services, 
        isLoading: false
      );

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: 'Error al obtener los servicios'
      );

    }
  }
}

class ServicesState{

  final List<Services> services;
  final bool isLoading;
  final String error;

  ServicesState({
    this.services = const [],
    this.isLoading = false,
    this.error = ''
  });

  ServicesState copyWith({
    List<Services>? services,
    bool? isLoading,
    String? error
  }) => ServicesState(
    services: services ?? this.services,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error
  );

}