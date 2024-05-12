import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';
import '../presentation.dart';

class RegisterPage extends StatelessWidget {

  static const name = 'RegisterPage';
  
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final color = AppTheme().getTheme().colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crear cuenta'),
          backgroundColor: color.primary,
        ),
        body:  const _RegisterForm(),
        )
      
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final registerForm = ref.watch(( registerFormProvider ));
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          // const SizedBox( height: 30 ),
          const Spacer(flex: 2),
          Text('Nueva cuenta', style: textStyles.titleMedium ),
          const Spacer(),
          // const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Nombre(*) ',
            keyboardType: TextInputType.name,
            onChanged: ref.read( registerFormProvider.notifier ).onNameChange,
            errorMessage: registerForm.isFormPosted
              ? registerForm.name.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Rut(*)',
            keyboardType: TextInputType.text,
            onChanged: ref.read( registerFormProvider.notifier ).onRutChange,
            errorMessage: registerForm.isFormPosted
              ? registerForm.rut.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),
          
          CustomTextFormField(
            label: 'Fecha de Nacimiento',
            keyboardType: TextInputType.datetime,
            onChanged: ref.read( registerFormProvider.notifier ).onBirthayChange,
            errorMessage: registerForm.isFormPosted
              ? registerForm.birthday.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Correo(*)',
            keyboardType: TextInputType.emailAddress,
            onChanged: ref.read( registerFormProvider.notifier ).onEmailChange,
            errorMessage: registerForm.isFormPosted
              ? registerForm.email.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Numero de Telefono(*)',
            keyboardType: TextInputType.emailAddress,
            onChanged: ref.read( registerFormProvider.notifier ).onPhoneChange,
            errorMessage: registerForm.isFormPosted
              ? registerForm.phone.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Contraseña(*)',
            obscureText: true,
            onChanged: ref.read( registerFormProvider.notifier ).onPasswordChanged,
            errorMessage: registerForm.isFormPosted
              ? registerForm.password.errorMessage
              : null,
          ),
          const SizedBox( height: 30 ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Crear',
              buttonColor: Colors.blueAccent.shade400,
              onPressed: (){ registerForm.isPosting
                ? null
                : ref.read( registerFormProvider.notifier ).onFormSubmit();
                // context.go('/');
              },
            )
          ),

          const Spacer( flex: 2 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                onPressed: (){
                  // if ( context.canPop()){
                  //   return context.pop();
                  // }
                  context.push('/login');
                  
                }, 
                child: const Text('Ingresa aquí')
              )
            ],
          ),

          const Spacer( flex: 1),
        ],
      ),
    );
  }
}