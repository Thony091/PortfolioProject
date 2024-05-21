import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class ProductDetailPage extends ConsumerWidget {

  final String productId;
  static const name = 'productDetailPage';

  const ProductDetailPage({super.key, required this.productId});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authState = ref.watch( authProvider );
    final productState = ref.watch( productProvider(productId) );
    final color = AppTheme().getTheme().colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Product Detail'),
        backgroundColor: color.primary,
      ),
      body: productState.isLoading 
        ? const FullScreenLoader()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( productState.id ),
                Text( productState.product?.name.toString() ?? 'cargando...'),
                Text( productState.product?.description.toString() ?? 'cargando...'),
                Text( productState.product?.price.toString() ?? 'cargando...'),
              ],
            ),
          ),
          floatingActionButton:  ( authState.authStatus != AuthStatus.authenticated)
            ? null 
            : (authState.userData!.isAdmin) 
              ? 
                FloatingActionButton.extended(
                  label: const Text('Guardar Producto'),
                  icon: const Icon( Icons.save_as_outlined ),
                  onPressed: () {
                    // context.push('/product/new');
                  },
                )
              : null,
    );
  }
}






class _ProductView extends StatelessWidget {

  final Product product;

  const _ProductView({required this.product});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return ListView(
      children: [
    
          SizedBox(
            height: 250,
            width: 600,
            child: _ImageGallery(images: product.images ),
          ),
    
          const SizedBox( height: 10 ),
          Center(child: Text( product.name, style: textStyles.titleSmall )),
          const SizedBox( height: 10 ),
          _ProductInformation( product: product ),
          
        ],
    );
  }
}


class _ProductInformation extends ConsumerWidget {
  final Product product;
  const _ProductInformation({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Generales'),
          const SizedBox(height: 15 ),
          CustomProductField( 
            isTopField: true,
            label: 'Nombre',
            initialValue: product.name,
          ),
          // CustomProductField( 
          //   isTopField: true,
          //   label: 'Slug',
          //   initialValue: product.slug,
          // ),
          CustomProductField( 
            isBottomField: true,
            label: 'Precio',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: product.price.toString(),
          ),

          // const SizedBox(height: 15 ),
          // const Text('Extras'),

          // _SizeSelector(selectedSizes: product.sizes ),
          // const SizedBox(height: 5 ),
          // _GenderSelector( selectedGender: product.gender ),
          

          const SizedBox(height: 15 ),
          CustomProductField( 
            isTopField: true,
            label: 'Existencias',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: product.stock.toString(),
          ),

          CustomProductField( 
            maxLines: 6,
            label: 'Descripción',
            keyboardType: TextInputType.multiline,
            initialValue: product.description,
          ),

          // CustomProductField( 
          //   isBottomField: true,
          //   maxLines: 2,
          //   label: 'Tags (Separados por coma)',
          //   keyboardType: TextInputType.multiline,
          //   initialValue: product.tags.join(', '),
          // ),


          const SizedBox(height: 100 ),
        ],
      ),
    );
  }
}


class _SizeSelector extends StatelessWidget {
  final List<String> selectedSizes;
  final List<String> sizes = const['XS','S','M','L','XL','XXL','XXXL'];

  const _SizeSelector({required this.selectedSizes});


  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      segments: sizes.map((size) {
        return ButtonSegment(
          value: size, 
          label: Text(size, style: const TextStyle(fontSize: 10))
        );
      }).toList(), 
      selected: Set.from( selectedSizes ),
      onSelectionChanged: (newSelection) {
        print(newSelection);
      },
      multiSelectionEnabled: true,
    );
  }
}

class _GenderSelector extends StatelessWidget {
  final String selectedGender;
  final List<String> genders = const['men','women','kid'];
  final List<IconData> genderIcons = const[
    Icons.man,
    Icons.woman,
    Icons.boy,
  ];

  const _GenderSelector({required this.selectedGender});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton(
        multiSelectionEnabled: false,
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity.compact ),
        segments: genders.map((size) {
          return ButtonSegment(
            icon: Icon( genderIcons[ genders.indexOf(size) ] ),
            value: size, 
            label: Text(size, style: const TextStyle(fontSize: 12))
          );
        }).toList(), 
        selected: { selectedGender },
        onSelectionChanged: (newSelection) {
          print(newSelection);
        },
      ),
    );
  }
}


class _ImageGallery extends StatelessWidget {
  final List<String> images;
  const _ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(
        viewportFraction: 0.7
      ),
      children: images.isEmpty
        ? [ ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset('assets/images/no-image.jpg', fit: BoxFit.cover )) 
        ]
        : images.map((e){
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(e, fit: BoxFit.cover,),
          );
      }).toList(),
    );
  }
}