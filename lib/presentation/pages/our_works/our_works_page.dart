import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../config/config.dart';
import '../../presentation_container.dart';
import 'components/work_card.dart';

class OurWorksPage extends ConsumerWidget {
  static const String name = 'OurWorksPage';
  const OurWorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final color = AppTheme().getTheme().colorScheme;
    final authState   = ref.watch( authProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Trabajos'),
        backgroundColor: color.primary,
      ),
      body: const BackgroundImageWidget(
        opacity: 0.1, 
        child: _OurWorksBodyPage()
      ),
      floatingActionButton: ( authState.authStatus != AuthStatus.authenticated)
        ? null 
        : ( authState.userData!.isAdmin ) 
          ? 
            FloatingActionButton.extended(
              label: const Text('Nuevo Servicio'),
              icon: const Icon( Icons.add ),
              onPressed: () {
                // context.push('/product/new');
              },
            )
          : null,
    );
  }
}

class _OurWorksBodyPage extends ConsumerWidget {

  const _OurWorksBodyPage();

  initState(WidgetRef ref){
    ref.read(worksProvider.notifier).getWorks();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final worksState = ref.watch( worksProvider );

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: MasonryGridView.count(
        crossAxisCount: 1, 
        mainAxisSpacing: 20,
        itemCount: worksState.works.length,
        itemBuilder: (context, index) {
          final work = worksState.works[index];
          return GestureDetector(
            onTap: (){},
            child: WorkCard( 
              work: work 
              
            )
          );
        },
      ),
    );
  }
}