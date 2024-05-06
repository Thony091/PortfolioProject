import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  
  static const name = 'productDetailPage';

  // final Product product;

  // ProductDetailPage({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(product.name),
      ),
      body: Center(
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