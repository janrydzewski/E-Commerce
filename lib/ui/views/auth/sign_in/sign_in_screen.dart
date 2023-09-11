import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          context.go('/home');
        }
        if (state.authStatus == AuthStatus.error) {
          snackBarError(context, state.message);
        }
      },
      builder: (context, state) {
        if (state.authStatus == AuthStatus.loading) {
          return const Loading();
        }
        if (state.authStatus == AuthStatus.unauthenticated) {
          return SizedBox(
            width: 375.w,
            height: 812.h,
            child: Scaffold(
              appBar: AppBar(),
              backgroundColor: isDarkMode
                  ? ColorProvider.backgroundDark
                  : ColorProvider.backgroundLight,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loginToYourAccountWidget(isDarkMode),
                    formSignInWidget(_formKey, _emailController,
                        _passwordController, isDarkMode),
                    signInButton(_formKey, _emailController,
                        _passwordController, isDarkMode, context),
                    forgotPasswordWidget(isDarkMode),
                    dividerWidget(isDarkMode),
                    thirdAppWidget(isDarkMode),
                    dontHaveAccountWidget(isDarkMode, context),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
