import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          context.go('/application/home');
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
                    createYourAccountWidget(isDarkMode),
                    formSignUpWidget(_formKey, _emailController,
                        _passwordController, isDarkMode),
                    signUpButton(_formKey, _emailController,
                        _passwordController, isDarkMode, context),
                    dividerSignUpWidget(isDarkMode),
                    thirdAppWidget(isDarkMode),
                    alreadyHaveAnAccountWidget(isDarkMode, context),
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
