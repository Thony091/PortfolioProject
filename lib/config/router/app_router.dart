

import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
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

    ] 
);