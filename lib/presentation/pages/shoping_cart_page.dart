import 'package:flutter/material.dart';

import '../../config/config.dart';

class ShopingCartPage extends StatelessWidget {

  static const name = 'ShopingCartPage';

  const ShopingCartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final color = AppTheme().getTheme().colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        title: const Text('Shoping Cart Page'),
      ),
      body: const _ShopingCartBodyPage(),
    );
  }
}

class _ShopingCartBodyPage extends StatelessWidget {
  const _ShopingCartBodyPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Shoping Cart Page'),
    );
  }
}