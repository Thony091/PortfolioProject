import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {

  final String productId;
  static const name = 'productDetailPage';

  const ProductDetailPage({super.key, required this.productId});

  // final Product product;

  // ProductDetailPage({this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final productState = ref.watch( productProvider(productId) );

    return Scaffold(
      appBar: AppBar(
        // title: Text(product.name),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(product.name),
            // Text(product.price.toString()),
          ],
        ),
      ),
    );
  }
}