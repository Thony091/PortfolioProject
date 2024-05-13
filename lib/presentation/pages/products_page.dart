import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../config/config.dart';
import '../presentation.dart';

class ProductsPage extends StatelessWidget {

  static const name = 'ProductsPage';
  
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final color       = AppTheme().getTheme().colorScheme;


    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text("Products Page"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon( Icons.search_rounded)
          ),
          
        ],
        backgroundColor: color.primary,
      ),
        body: const _ProductsBodyPage(),
    );
  }
}

class _ProductsBodyPage extends ConsumerStatefulWidget {
  const _ProductsBodyPage();

  @override
  _ProductsBodyPageState createState() => _ProductsBodyPageState();
}

class _ProductsBodyPageState extends ConsumerState {

  // final productsState = ref.watch( productsProvider );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MasonryGridView.count(
        // controller: scrollController,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2, 
        mainAxisSpacing: 30,
        crossAxisSpacing: 35,
        itemCount: 10,
        itemBuilder: (context, index) {
          // final product = productsState.products[index];
          return GestureDetector(
            // onTap: () =>  context.push('/product/${ product.id }'),
            child: CustomProductCard(
              image: 'assets/images/AR_2.png',
              title: 'Product $index',
              price: 100,
              press: (){},
              bgColor: const Color(0xFFFBFBFD),  
            )
          );
        },
      ),
    );
  }
}