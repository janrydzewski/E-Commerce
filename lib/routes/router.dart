import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/views/views.dart';
import 'package:ecommerce/data/models/models.dart';

class MyRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation:
        firebaseAuth.currentUser == null ? '/initWelcome' : '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/initWelcome',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const InitStart(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const Welcome(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/start',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const Start(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/signIn',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignIn(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/signUp',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUp(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return Application(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
              name: 'Home',
              path: '/home',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: Home());
              },
              routes: <RouteBase>[
                GoRoute(
                  name: 'Special Offers',
                  path: 'special_offers',
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: const SpecialOffers(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
                GoRoute(
                    name: 'ShowProduct',
                    path: 'show_product',
                    pageBuilder: (context, state) {
                      final productModel = state.extra as ProductModel;
                      return CustomTransitionPage(
                        child: ShowProduct(
                            productModel: productModel,
                            type: productModel.category),
                        transitionsBuilder: (context, animation,
                                secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    }),
                GoRoute(
                  name: 'CategoryProduct',
                  path: 'category_product',
                  pageBuilder: (context, state) {
                    final category = state.extra as String;
                    return CustomTransitionPage(
                      child: CategoryProduct(
                        category: category,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    );
                  },
                ),
              ]),
          GoRoute(
              name: 'Cart',
              path: '/cart',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Cart()),
              routes: <RouteBase>[
                GoRoute(
                    name: 'Checkout',
                    path: 'checkout',
                    pageBuilder: (context, state) => CustomTransitionPage(
                          child: const Checkout(),
                          transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                        ),
                  routes: <RouteBase>[
                    GoRoute(
                      name: 'Shipping',
                      path: 'shipping',
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Shipping()),
                    ),
                    GoRoute(
                      name: 'Payment',
                      path: 'payment',
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Payment()),
                    ),
                  ],
                    ),
              ]),
          GoRoute(
            name: 'Wallet',
            path: '/wallet',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Wallet()),
          ),
          GoRoute(
            name: 'Orders',
            path: '/orders',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Orders()),
          ),
          GoRoute(
            name: 'Profile',
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: Profile()),
            routes: <RouteBase>[
              GoRoute(
                name: 'Edit Profile',
                path: 'edit_profile',
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const EditProfile(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              ),
              GoRoute(
                name: 'Select Address',
                path: 'select_address',
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Address(),
                  transitionsBuilder: (context, animation,
                      secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    name: 'Add Address',
                    path: 'add_address',
                    pageBuilder: (context, state) => CustomTransitionPage(
                      child: const AddAddress(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),

              GoRoute(
                name: 'Admin',
                path: 'admin',
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const Admin(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    name: 'Add Product',
                    path: 'add_product',
                    pageBuilder: (context, state) => CustomTransitionPage(
                      child: const AddProduct(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                  GoRoute(
                    name: 'Edit Product',
                    path: 'edit_product',
                    pageBuilder: (context, state) => CustomTransitionPage(
                      child: const EditProduct(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        name: 'Edit Product Details',
                        path: 'edit_product_details',
                        pageBuilder: (context, state) {
                          final productModel = state.extra as ProductModel;
                          return CustomTransitionPage(
                            child:
                                EditProductDetails(productModel: productModel),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                FadeTransition(
                                    opacity: animation, child: child),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      child: const Error(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
