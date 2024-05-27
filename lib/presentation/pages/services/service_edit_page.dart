import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/config.dart';
import '../../../domain/domain.dart';
import '../../presentation_container.dart';
import '../../shared/widgets/custom_product_field.dart';

class ServiceEditPage extends ConsumerWidget{

  final String serviceId;
  static const String name = 'ServiceEditPage';

  const ServiceEditPage({super.key, required this.serviceId});

  void showSnackbar( BuildContext context ) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto Actualizado'))
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final serviceState = ref.watch( serviceProvider( serviceId ) );
    final color = AppTheme().getTheme().colorScheme;
    
    return GestureDetector(
      onTap: () => FocusScope.of( context ).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text( serviceState.service?.name ?? ' Cargando...'),
          backgroundColor: color.primary,
          actions: [
            IconButton(onPressed: () async {
              final photoPath = await CameraGalleryServiceImpl().selectPhoto();
              if ( photoPath == null ) return;

              ref.read( serviceFormProvider(serviceState.service!).notifier )
                .updateServiceImage(photoPath);
    
            }, 
            icon: const Icon( Icons.photo_library_outlined )),

            IconButton(onPressed: () async{
              final photoPath = await CameraGalleryServiceImpl().takePhoto();
              if ( photoPath == null ) return;

              ref.read( serviceFormProvider( serviceState.service!).notifier )
                .updateServiceImage(photoPath);
            }, 
            icon: const Icon( Icons.camera_alt_outlined ))
          ],
        ),
        body: serviceState.isLoading
          ? const FullScreenLoader()
          : _ServiceDetailBodyPage( service: serviceState.service! ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text( 'Guardar Cambios' ),
          icon: const Icon( Icons.save_outlined, ),
          onPressed: () {
            if ( serviceState.service == null) return;
            ref.read(
              serviceFormProvider( serviceState.service! ).notifier
            ).onFormSubmit()
            .then((value) {
              if ( !value ) return;
              showSnackbar(context);
            });
          },
        )
      )
    );
  }

}

class _ServiceDetailBodyPage extends ConsumerWidget {

  final Services service;

  const _ServiceDetailBodyPage({ required this.service });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final serviceForm = ref.watch( serviceFormProvider( service ) );
    final textStyles = Theme.of(context).textTheme;

    return ListView(
      children: [

        SizedBox(
          height: 250,
          width: 600,
          child: CustomImageGallery(images: serviceForm.images),
        ),

        const SizedBox( height: 20 ),

        Center( child: Text( serviceForm.name.value, style: textStyles.titleSmall )),

        const SizedBox( height: 20 ),

        _ServiceInformation(service: service),

      ],
    );
  }
}


class _ServiceInformation extends ConsumerWidget {

  final Services service;
  
  const _ServiceInformation({required this.service});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final serviceForm = ref.watch( serviceFormProvider( service ) );

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
            initialValue: serviceForm.name.value,
            onChanged: ref.read( serviceFormProvider( service ).notifier ).onNameChange,
            errorMessage: serviceForm.name.errorMessage,
          ),

          CustomProductField( 
            isTopField: true,
            label: 'Precio Minimo',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: serviceForm.minPrice.value.toString(),
            onChanged: (value) => ref.read( serviceFormProvider( service ).notifier )
              .onMinPriceChange( double.parse(value) ?? 0),
            errorMessage: serviceForm.minPrice.errorMessage,
          ),
          CustomProductField( 
            isBottomField: true,
            label: 'Precio Maximo',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: serviceForm.maxPrice.value.toString(),
            onChanged: (value) => ref.read( serviceFormProvider( service ).notifier )
              .onMaxPriceChange( double.parse(value) ?? 0),
            errorMessage: serviceForm.minPrice.errorMessage,
          ),

          const SizedBox(height: 15 ),

          CustomProductField(
            maxLines: 6,
            label: 'Descripción',
            keyboardType: TextInputType.multiline,
            initialValue: serviceForm.description.value,
            onChanged: ref.read( serviceFormProvider( service ).notifier ).onDescriptionChange,
            errorMessage: serviceForm.description.errorMessage,
          ),


          const SizedBox(height: 30 ),
        ],
      ),
    );
  }
}
