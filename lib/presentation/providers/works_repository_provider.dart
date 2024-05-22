
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../presentation.dart';

final worksRepositoryProvider = Provider<RealizedWorkRepository>((ref) {
  
  final accessToken = ref.watch( authProvider ).user?.user!.getIdToken().toString() ?? '' ;
  
  final worksRepository = RealizedWorksRepositoryImpl(
    RealizedWorkDatasourceImpl(accessToken: accessToken)
  );

  return worksRepository;
});