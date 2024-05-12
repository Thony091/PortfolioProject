

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';
import 'router.dart';


final goRouterProvider = Provider( (ref) {

  final goRouterNotifier = ref.read( goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: goRouterNotifier,
    routes: 
      [
        //* Home
        GoRoute(
          path: '/',
          name: HomePage.name,
          builder: (context, state) => const HomePage(),
        ),

        //* Login
        GoRoute(
          path: '/login',
          name: LoginPage.name,
          builder: (context, state) => const LoginPage(),
        ),

        //* Register
        GoRoute(
          path: '/register',
          name: RegisterPage.name,
          builder: (context, state) => const RegisterPage(),
        ),

        //* Pago
        GoRoute(
          path: '/pago',
          name: PagoPage.name,
          builder: (context, state) => const PagoPage(),
        ),

        //* Products
        GoRoute(
          path: '/products',
          name: ProductsPage.name,
          builder: (context, state) => const ProductsPage(),
          // routes: 
          //   [
          //     //* Product Detail
          //     GoRoute(
          //       path: '/:id',
          //       name: ProductDetailPage.name,
          //       builder: (context, state) => ProductDetailPage(id: state.params['id']!),
          //     ),
          //   ],
        ),

        //* Reservations
        GoRoute(
          path: '/reservations',
          name: ReservationsPage.name,
          builder: (context, state) => const ReservationsPage(),
        ),

        //* Services
        GoRoute(
          path: '/services',
          name: ServicesPage.name,
          builder: (context, state) => const ServicesPage(),
        ),

      ],

    redirect: (context, state) {

      final isGoingTo = state.subloc;
      final authStatus = goRouterNotifier.authStatus;

      if ( authStatus == AuthStatus.authenticated ) {
        if ( isGoingTo == '/login' || isGoingTo == '/register' || isGoingTo == '/splash' ){
           return '/';
        }
      }

      if ( authStatus == AuthStatus.notAuthenticated ) {
        if ( isGoingTo == '/pago' ){
           return '/login';
        }
      }
      return null;
    }
  );
});