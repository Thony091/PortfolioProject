import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../presentation.dart';


final worksProvider = StateNotifierProvider<WorksNotifier,  WorksState>((ref) {
  
  final worksRepository = ref.watch( worksRepositoryProvider );

  return WorksNotifier(worksRepository: worksRepository);
});


class WorksNotifier extends StateNotifier<WorksState>{

  final RealizedWorkRepository worksRepository;

  WorksNotifier({
    required this.worksRepository
  }) : super( WorksState()){
    getWorks();
  }

  Future<void> getWorks() async {

    state = state.copyWith(loading: true);

    try {

      final works = await worksRepository.getRealizedWorks();

      state = state.copyWith(
        works: works, 
        loading: false
      );

    } catch (e) {
      state = state.copyWith(
        error: 'Error al obtener los trabajos', 
        loading: false
      );
    }
  }


}


class WorksState{

  final List<Works> works;
  final bool loading;
  final String error;

  WorksState({
    this.works = const [], 
    this.loading = true, 
    this.error = '',
  });

  WorksState copyWith({
    List<Works>? works, 
    bool? loading, 
    String? error
  }) => WorksState(
      works: works ?? this.works,
      loading: loading ?? this.loading,
      error: error ?? this.error
    );
  

}