import 'dart:ui';

import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:ecommerce/resources/resources.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  MyRouter myRouter = MyRouter();

  runApp(MyApp(
    router: myRouter.router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(firebaseFirestore: firebaseFirestore),
        ),
        RepositoryProvider(
          create: (context) =>
              ProductRepository(firebaseFirestore: firebaseFirestore),
        ),
        RepositoryProvider(
          create: (context) =>
              CartRepository(firebaseFirestore: firebaseFirestore),
        ),
        RepositoryProvider(
          create: (context) =>
              AdminRepository(firebaseFirestore: firebaseFirestore),
        ),
        RepositoryProvider(
          create: (context) =>
              OrdersRepository(firebaseFirestore: firebaseFirestore),
        ),
        RepositoryProvider(
          create: (context) =>
              AddressRepository(firebaseFirestore: firebaseFirestore),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ApplicationBloc(),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              productRepository:
                  RepositoryProvider.of<ProductRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ShowProductBloc(),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: RepositoryProvider.of<CartRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => CartItemBloc(
              cartRepository: RepositoryProvider.of<CartRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AddProductAdminBloc(
              adminRepository: RepositoryProvider.of<AdminRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => EditProductAdminBloc(
              adminRepository: RepositoryProvider.of<AdminRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => EditProfileBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => OrdersBloc(
              ordersRepository:
                  RepositoryProvider.of<OrdersRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AddressBloc(
              addressRepository:
                  RepositoryProvider.of<AddressRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AddAddressBloc(
              addressRepository:
                  RepositoryProvider.of<AddressRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ShippingBloc(),
          ),
          BlocProvider(
            create: (context) => PaymentBloc(
              orderRepository: RepositoryProvider.of<OrdersRepository>(context),
              cartRepository: RepositoryProvider.of<CartRepository>(context),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => BlocBuilder<ThemeCubit, Brightness>(
            builder: (context, state) {
              final isDarkMode = state == Brightness.dark;
              return MaterialApp.router(
                builder: (context, child) {
                  return ScrollConfiguration(
                    behavior: DisableGlow(),
                    child: child!,
                  );
                },
                theme: isDarkMode ? darkTheme : lightTheme,
                debugShowCheckedModeBanner: false,
                routeInformationProvider: router.routeInformationProvider,
                routeInformationParser: router.routeInformationParser,
                routerDelegate: router.routerDelegate,
              );
            },
          ),
        ),
      ),
    );
  }
}
