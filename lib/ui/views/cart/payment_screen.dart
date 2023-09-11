import 'package:ecommerce/bloc/bloc.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late PaymentBloc paymentBloc;

  @override
  void initState() {
    paymentBloc = PaymentBloc(
        orderRepository: RepositoryProvider.of<OrdersRepository>(context),
        cartRepository: RepositoryProvider.of<CartRepository>(context));
    super.initState();
  }

  @override
  void dispose() {
    paymentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeCubit>().state;
    final isDarkMode = state == Brightness.dark;
    return SizedBox(
      width: 375.w,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ColorProvider.backgroundDark
            : ColorProvider.backgroundLight,
        body: SafeArea(
          child: BlocBuilder<PaymentBloc, PaymentState>(
            bloc: paymentBloc,
            builder: (context, state) {
              CardFormEditController controller = CardFormEditController(
                  initialDetails: state.cardFieldInputDetails);
              if (state.status == PaymentStatus.initial) {
                return initialPaymentWidget(
                    isDarkMode, controller, context, paymentBloc);
              } else if (state.status == PaymentStatus.success) {
                return successPaymentWidget(isDarkMode);
              } else if (state.status == PaymentStatus.failure) {
                return failurePaymentWidget(isDarkMode);
              } else {
                return const Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}
