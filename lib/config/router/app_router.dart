

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

        //* Config
        GoRoute(
          path: '/config',
          name: ConfigUserPage.name,
          builder: (context, state) => const ConfigUserPage(),
        ),

        //* Shoping Cart
        GoRoute(
          path: '/shoping-cart',
          name: ShopingCartPage.name,
          builder: (context, state) => const ShopingCartPage(),
        ),

        //* Our Works
        GoRoute(
          path: '/our-works',
          name: OurWorksPage.name,
          builder: (context, state) => const OurWorksPage(),
        ),

        //* AdminZone
        //* HomeAdminPage
        GoRoute(
          path: '/admin-home',
          name: HomeAdminPage.name,
          builder: (context, state) => const HomeAdminPage(),
        ),

        //* ConfigProductsPage
        GoRoute(
          path: '/admin-config-products',
          name: ConfigProductsPage.name,
          builder: (context, state) => const ConfigProductsPage(),
        ),

        //* ConfigServicesPage
        GoRoute(
          path: '/admin-config-services',
          name: ConfigServicesPage.name,
          builder: (context, state) => const ConfigServicesPage(),
        ),
        
        //* ConfigWorksPage
        GoRoute(
          path: '/admin-config-works',
          name: ConfigWorksPage.name,
          builder: (context, state) => const ConfigWorksPage(),
        ),

        //* ContactTicketsPage
        GoRoute(
          path: '/admin-contact-tickets',
          name: ContactTicketsPage.name,
          builder: (context, state) => const ContactTicketsPage(),
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
        if ( isGoingTo == '/pago' || isGoingTo == '/config' ){
           return '/login';
        }
      }
      return null;
    }
  );
});