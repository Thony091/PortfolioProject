import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../presentation.dart';

class ProductDetailPage extends ConsumerWidget {

  final String productId;
  static const name = 'productDetailPage';

  const ProductDetailPage({super.key, required this.productId});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final productState = ref.watch( productProvider(productId) );
    final color = AppTheme().getTheme().colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text( 'Product Detail'),
        backgroundColor: color.primary,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( productState.id ),
            Text( productState.product!.name.toString() ),
            Text( productState.product!.description.toString() ),
            Text( productState.product!.price.toString() ),
          ],
        ),
      ),
    );
  }
}