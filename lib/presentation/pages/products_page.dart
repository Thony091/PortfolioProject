import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/widgets/side_menu.dart';

class ProductsPage extends StatelessWidget {

  static const name = 'ProductsPage';
  
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text("Products Page"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon( Icons.search_rounded)
          )
        ],
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
    return const Center(
    child: Text('Products Page'),
          );
  }
}