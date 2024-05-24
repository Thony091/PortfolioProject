import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolio_project/presentation/shared/widgets/custom_product_field.dart';

import '../../config/config.dart';
import '../presentation.dart';


class ReservationsPage extends StatelessWidget {

  static const name = 'ReservationsPage';
  
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    // final scaffoldKey = GlobalKey<ScaffoldState>();
    final color = AppTheme().getTheme().colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservations Page"),
        backgroundColor: color.primary,
      ),
      body: const BackgroundImageWidget(
        opacity: 0.1,
        child: Center(
          child: _ReservationFormBody(),
        ),
      ),
      // drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _ReservationFormBody extends ConsumerWidget {

  const _ReservationFormBody();

  void callDatePicker() async {
    // var orderDate = DateTime.now();
    // var orderTime = TimeOfDay.now();
    // var date = await showDatePicker(
    //   context: context,
    //   initialDate: orderDate,
    //   firstDate: orderDate,
    //   lastDate: DateTime(2022),
    // );
    // if (date != null) {
    //   var time = await showTimePicker(
    //     context: context,
    //     initialTime: orderTime,
    //   );
    //   if (time != null) {
    //     orderDate = DateTime(
    //       date.year,
    //       date.month,
    //       date.day,
    //       time.hour,
    //       time.minute,
    //     );
    //     print(orderDate);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    List<String> opciones = ['Opción 1', 'Opción 2', 'Opción 3'];

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag ,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0
        ), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Haz tu Reserva", 
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
      
            CustomProductField(
              isBottomField: true,
              isTopField: true,
              label: "Name",
              hint: "Nombre Completo",
              onChanged: (value) {
                // ref.read(loginFormProvider.notifier).emailChanged(value);
              },
            ),
            const SizedBox(height: 10.0),
      
            CustomProductField(
              isBottomField: true,
              isTopField: true,
              label: "Rut",
              hint: "Rut",
              onChanged: (value) {
                // ref.read(loginFormProvider.notifier).emailChanged(value);
              },
            ),
            const SizedBox(height: 10.0),
      
            CustomProductField(
              isBottomField: true,
              isTopField: true,
              label: "Correo Electrónico",
              hint: "Correo Electrónico",
              onChanged: (value) {
                // ref.read(loginFormProvider.notifier).emailChanged(value);
              },
            ),
            const SizedBox(height: 10.0),
      
            CustomProductField(
              isBottomField: true,
              isTopField: true,
              label: "Fecha de Reserva",
              hint: "Fecha de Reservación",
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                // ref.read(loginFormProvider.notifier).emailChanged(value);
              },
            ),
            SizedBox(
              child: Container(
                
              ),
            ),
            const SizedBox(height: 10.0),
      
            CustomProductField(
              isBottomField: true,
              isTopField: true,
              label: "Hora",
              hint: "Hora de la Reservación",
              onChanged: (value) {
                // ref.read(loginFormProvider.notifier).emailChanged(value);
              },
            ),
      
            const SizedBox(height: 10.0),
      
            SizedBox(
              width: double.infinity,
              height: 80.0 ,
              child: DropdownButton<String>(
                hint: const Text("Seleccione una opción"), // Opcional: texto de sugerencia
                items: opciones.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(value), // Muestra el texto de la opción
                        Icon(Icons.arrow_forward_ios, size: 24, color: Colors.grey[700]), // Flecha para indicar más opciones
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Acción a realizar cuando se selecciona una opción
                  print(newValue);
                },
              )
            ),
            
      
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: CustomFilledButton(
                text: "Reservar",
                buttonColor: Colors.blueAccent.shade400,
                onPressed: () {
                  // ref.read(goRouterProvider).go('/reservations');
                },
              ),
            )
          ]
        )
      ),
    );
  }
}