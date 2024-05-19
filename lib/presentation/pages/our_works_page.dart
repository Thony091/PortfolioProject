import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_project/presentation/shared/widgets/background_image_widget.dart';

import '../../config/config.dart';

class OurWorksPage extends StatelessWidget {
  static const String name = 'OurWorksPage';
  const OurWorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color = AppTheme().getTheme().colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Works'),
        backgroundColor: color.primary,
      ),
      body: const BackgroundImageWidget(
        opacity: 0.1, 
        child: _OurWorksBodyPage()
      ),
    );
  }
}

class _OurWorksBodyPage extends ConsumerWidget {

  const _OurWorksBodyPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text('OurWorksPage'),
    );
  }
}