import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/ui/widgets/widgets.dart';

class InitStart extends StatefulWidget {
  const InitStart({super.key});

  @override
  State<InitStart> createState() => _InitStartState();
}

class _InitStartState extends State<InitStart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/welcome');
      },
      child: Scaffold(
        backgroundColor: ColorProvider.backgroundLight,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              mainPhoto(),
              mainTextInit(),
            ],
          ),
        ),
      ),
    );
  }
}
