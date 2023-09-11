import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class Application extends StatefulWidget {
  final Widget child;

  const Application({super.key, required this.child});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Brightness>(
      builder: (context, state) {
        final state = context.read<ThemeCubit>().state;
        final isDarkMode = state == Brightness.dark;
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.authStatus == AuthStatus.error) {
              snackBarError(context, state.message);
            }
          },
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.userStatus == UserStatus.error) {
                snackBarError(context, state.message);
              }
            },
            builder: (context, state) {
              if (state.userStatus == UserStatus.loading) {
                return const Loading();
              }
              if (state.userStatus == UserStatus.loaded) {
                return BlocBuilder<ApplicationBloc, ApplicationState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 375.w,
                      height: 812.h,
                      child: Scaffold(
                        bottomNavigationBar: Theme(
                            data: applicationThemeData(isDarkMode),
                            child: bottomNavigationBarWidget(
                                isDarkMode, context, state)),
                        body: widget.child,
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
